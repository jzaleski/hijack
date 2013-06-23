require 'hijack/util/buffer'
require 'hijack/util/callback_manager'
require 'hijack/util/script_manager'

class BaseBridge

  attr_reader :callback_manager, :input_buffer, :output_buffer

  def initialize(config)
    @config = config
    @input_buffer = Buffer.new
    @output_buffer = Buffer.new
    @callback_manager = CallbackManager.new
    @script_manager = ScriptManager.new(
      @config,
      self,
      @callback_manager
    )
  end

  def required_arguments
    []
  end

  def connect!
    raise 'All Bridge(s) must override the "connect!" method and set "@socket"'
  end

  def connected?
    !@socket.nil? && !@socket.closed?
  end

  def gets
    line = @output_buffer.gets
    @callback_manager.process("#{line}".chomp)
    line
  end

  def puts(command)
    # exit[ing]
    if command =~ /\A(exit|quit)\Z/
      # send the command immediately
      @socket.puts command
      # close the socket
      close!
      # quit the screen-session (if applicable)
      %x{screen -X quit > /dev/null 2>&1} if ENV['STY']
      # short-circuit (no reason to proceed any further, since we are exiting)
      return
    end
    # repeat[ing] last command
    command = @last_command if command == '!!' && @last_command
    # store the command (we need to copy the string since the reference is
    # mutated below)
    @last_command = "#{command}"
    # script handling (this should probably be moved to script-manager)
    if command.start_with?(';')
      @script_manager.execute(command[1..-1])
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
          @input_buffer.puts command_parts[0].rstrip
        end
      end
    end
  end

  def close!
    @socket.close rescue nil
  end

  def start_buffering!
    @read_thread ||= Thread.new do
      while connected?
        @output_buffer.puts @socket.gets
      end
    end
    @write_thread ||= Thread.new do
      while connected?
        next unless can_write?
        @socket.puts @input_buffer.gets
        @last_write_time = Time.now
      end
    end
  end

  private

  def can_write?
    !(@last_write_time && (Time.now - @last_write_time).to_f * 1000 < \
    (@config[:allowed_command_frequency_ms] || 100))
  end

end
