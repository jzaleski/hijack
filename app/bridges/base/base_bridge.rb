class BaseBridge

  def initialize(config)
    @config = config
    @input_buffer = Buffer.new
    @output_buffer = Buffer.new
    @layout_helper = LayoutHelper.new(@config)
    @callback_helper = CallbackHelper.new
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

  def disconnect(command=nil)
    # send the command immediately (if specified)
    socket.puts(command) if !command.nil? && !command.empty?
    # close the socket
    close
    # quit the screen-session (if applicable)
    %x{screen -X quit > /dev/null 2>&1} if ENV['STY']
  end

  def gets
    line = @output_buffer.gets
    @callback_helper.process("#{line}".chomp)
    line
  end

  def puts(command, opts={})
    # merge default options
    opts = {:store_command => true}.merge(opts)
    # repeat[ing] last command
    command = @last_command if command == '!!' && @last_command
    # store the command (we need to copy the string since the reference is
    # mutated below)
    @last_command = "#{command}" if opts[:store_command] == true
    # script handling (this should probably be moved to script-manager)
    if command.start_with?(';')
      @script_helper.execute(command[1..-1])
    # regular command(s)
    else
      # multiple commands [on a single line] are pipe-delimited
      command.split('|').each do |sub_command|
        # [always] remove leading/trailing whitespace
        sub_command.strip!
        # repeated commands are formatted like: "<command> * <num_repeats>"
        command_parts = sub_command.split('*')
        # guard against non-numeric or less than "1"
        num_repeats = [1, command_parts[1].lstrip.to_i].max rescue 1
        1.upto(num_repeats) do |counter|
          # enqueue the command (and pass "opts" along)
          @input_buffer.puts([command_parts[0].rstrip, opts])
          # call the "on_enqueue" hook (if it was specified)
          opts[:on_enqueue].call if opts[:on_enqueue] rescue nil
        end
      end
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

end
