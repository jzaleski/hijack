class BaseBridge

  def initialize(config)
    @config = config
    @input_buffer = Buffer.new
    @output_buffer = Buffer.new
    @alias_helper = AliasHelper.new(@config)
    @arguments_helper = ArgumentsHelper.new
    @callback_helper = CallbackHelper.new
    @layout_helper = LayoutHelper.new(@config)
    @script_helper = ScriptHelper.new(
      @config,
      self,
      @input_buffer,
      @output_buffer,
      @callback_helper
    )
  end

  def close
    socket.close rescue nil
  end

  def connect
    raise %{All "#{BaseBridge}(s)" must override the "connect" method}
  end

  def connected?
    !socket.nil? && !socket.closed?
  end

  def disconnect(str=nil)
    # send the command immediately (if specified)
    socket.puts(str) unless str.nil? || str.empty?
    # close the socket
    close
  end

  def gets
    # convert CRLF to LF, then any left-over CR to LF, then remove the last LF
    str = @output_buffer.gets.gsub(/\r\n/, "\n").gsub(/\r/, "\n").chomp
    # process any callbacks (returns nil)
    @callback_helper.process(str)
    # return the result
    str
  end

  def puts(str, opts={})
    # merge default options
    opts = {:store_command => true}.merge(opts)
    # repeat[ing] last command
    str = @last_command if str == '!!' && @last_command
    # store the command (we need to copy the string since the reference is
    # mutated below)
    @last_command = str.dup if opts[:store_command] == true
    # config handling
    if str.start_with?('!')
      begin
        @config.public_send(*@arguments_helper.parse(str[1..-1]))
        @output_buffer.puts("\nOk.")
      rescue Exception => e
        backtrace = e.backtrace.map {|line| "\tfrom #{line}"}.join("\n")
        STDERR.puts "\n#{e.class}: #{e.message}\n#{backtrace}"
      end
    # layout handling
    elsif str.start_with?('~')
      begin
        @layout_helper.public_send(*@arguments_helper.parse(str[1..-1]))
        @output_buffer.puts("\nOk.")
      rescue Exception => e
        backtrace = e.backtrace.map {|line| "\tfrom #{line}"}.join("\n")
        STDERR.puts "\n#{e.class}: #{e.message}\n#{backtrace}"
      end
    # script handling
    elsif str.start_with?(';')
      @script_helper.execute(str[1..-1])
    # regular command(s)
    else
      # parse the command, this method will parse sub-commands, repeats and
      # replace aliases
      commands = parse_command(str)
      # enqueue all of the commands for dispatch
      commands.each {|command| @input_buffer.puts(command)}
      # call the "on_enqueue" hook (if it was specified)
      opts[:on_enqueue].call if opts[:on_enqueue] rescue nil
    end
  end

  def self.required_args
    [].freeze
  end

  def start_buffering
    @read_thread ||= Thread.new do
      while connected?
        @output_buffer.puts(socket.gets)
      end
    end
    @write_thread ||= Thread.new do
      while connected?
        # skip this iteration if we're not able to write
        next unless can_write?
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

  def socket
    raise %{All "#{BaseBridge}(s)" must override the "socket" method}
  end

  private

  def can_write?
    !(@last_write_time && (Time.now - @last_write_time).to_f * 1000 < \
    (@config[:allowed_command_frequency_ms] || 100))
  end

  def parse_command(str)
    # define an array to hold the aggregated result
    commands = []
    # sub-commands are pipe-delimited (e.g. command1|command2)
    str.split('|').each do |sub_str|
      # repeated commands include a multiplier (e.g. command * 2)
      command, num_repeats = sub_str.strip.split('*').map(&:strip)
      # check if the sub-command is an alias and replace it here
      command = @alias_helper.process(command)
      # ensure that "num_repeats" is at least 1
      num_repeats = [1, num_repeats.to_i].max
      # recurse, there was a scriptlet nested in an alias
      if num_repeats == 1 && command =~ /\*|\|/
        commands += parse_command(command)
      # apply the command multiplier (in most cases, 1)
      else
        commands += ([command] * num_repeats)
      end
    end
    commands
  end

end
