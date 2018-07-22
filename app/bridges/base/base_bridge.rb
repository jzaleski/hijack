class BaseBridge
  def initialize(config)
    @config = config
    @input_buffer = InputBuffer.new(@config)
    @output_buffer = OutputBuffer.new(@config)
    @alias_helper = AliasHelper.new(@config)
    @arguments_helper = ArgumentsHelper.new(@config)
    @callback_helper = CallbackHelper.new(@config)
    @layout_helper = LayoutHelper.new(@config)
    @logging_helper = LoggingHelper.new(@config)
    @highlights_helper = HighlightsHelper.new(@config)
    @script_helper = ScriptHelper.new(
      @config,
      self,
      @input_buffer,
      @output_buffer,
      @callback_helper,
      @logging_helper
    )
  end

  def connect
    raise %{All "#{BaseBridge}(s)" must override the "connect" method}
  end

  def connected?
    socket.present? &&
      !socket.closed?
  end

  def disconnect(str=nil)
    # send the command immediately (if specified)
    socket.puts(str) unless str.blank?
    # close the socket
    socket.close rescue nil
  end

  def gets
    # read a line from the output-buffer
    str = @output_buffer.gets
    # short-circuit, and return `''`, if `str` is `nil`
    return '' if str.nil?
    # convert CRLF to LF, then any left-over CR to LF, then remove the last LF
    str = str.gsub(/\r\n/, "\n").gsub(/\r/, "\n").chomp
    # process any callbacks (returns nil)
    @callback_helper.process(str)
    # apply any highlights, escape escaped escapes and return the result
    @highlights_helper.process(str).gsub(/\\e/, "\e")
  end

  def puts(str, opts={})
    # merge default options
    opts = {:store_command => true}.merge(opts)
    # repeat[ing] last command
    str = @last_command if str == '!!' && @last_command.present?
    # store the command (we need to copy the string since the reference is
    # mutated below)
    @last_command = str.dup if opts[:store_command] == true
    # handle the command
    handle_command(str)
  end

  def self.required_args
    []
  end

  def start_buffering
    @read_thread ||= Thread.new do
      while connected?
        @output_buffer.puts((socket.gets rescue nil))
      end
    end
    @write_thread ||= Thread.new do
      while connected?
        # some games have a limit on how frequently commands can be executed
        # and this loop will execute commands in near real time. To ensure that
        # we do not get rate-limited, we will throttle writes (the delay value
        # is configurable via the `allowed_command_frequency_ms`
        # config-parameter)
        throttle_write
        # extract the command and opts (opts *should* never be nil, but we are
        # safe either way)
        command, opts = @input_buffer.gets
        # send the command
        socket.puts(command)
        # update the last write time (we want this to occur as soon as possible
        # after the command is dispatched)
        @last_write_time = Time.now
        # call the "on_exec" hook (if it was specified)
        opts[:on_exec].call if opts[:on_exec] rescue nil
      end
    end
  end

  protected

  def handle_command(str)
    # config handling
    if str.start_with?('!')
      begin
        method, *args = @arguments_helper.parse(str[1..-1])
        method_result = @config.public_send(method, *args)
        method_result = 'nil' if method_result.nil?
        result = 'Ok.'
        result = "[config] #{method}: #{method_result}" \
          if args.empty? && method.end_with?('?')
        result = "[config] #{args[0]}: #{method_result}" \
          if args.length == 1
        @output_buffer.puts("\n#{result}")
      rescue Exception => e
        @logging_helper.exception(e)
      end
    # script handling
    elsif str.start_with?(';')
      @script_helper.execute(str[1..-1])
    # regular command(s)
    else
      # replace any aliases
      processed_str = @alias_helper.process(str)
      # enqueue the processed command for dispatch
      @input_buffer.puts(processed_str)
    end
  end

  def socket
    raise %{All "#{BaseBridge}(s)" must override the "socket" method}
  end

  private

  def throttle_write
    return if @last_write_time.nil?
    allowed_command_frequency_ms = @config[:allowed_command_frequency_ms].to_f
    last_write_time_delta_ms = (Time.now - @last_write_time).to_f * 1000.0
    return if last_write_time_delta_ms >= allowed_command_frequency_ms
    sleep_time = \
      (allowed_command_frequency_ms - last_write_time_delta_ms) / 1000.0
    Kernel::sleep(sleep_time)
  end
end
