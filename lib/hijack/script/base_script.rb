class BaseScript

  # TODO: consider passing in a reference to the bridge itself as opposed to or
  # in addition to the input/output buffers. There are some circumstances where
  # it could be nice to leverage all of the command parsing logic associated
  # with a bridge
  def initialize(config, input_buffer, output_buffer, callback_manager,
                 on_exec=nil, on_exit=nil, on_kill=nil)
    @config = config
    @input_buffer = input_buffer
    @output_buffer = output_buffer
    @callback_manager = callback_manager
    @on_exec = on_exec
    @on_exit = on_exit
    @on_kill = on_kill
  end

  def start_run(args)
    @thread ||= Thread.new {
      @on_exec.call rescue nil
      run(args)
      @on_exit.call rescue nil
    }
  end

  def kill
    if running?
      @thread.kill
      @on_kill.call rescue nil
    end
  end

  def run(args)
    raise 'All Scripts(s) must override the "run" method'
  end

  def validate_args(args)
    true
  end

  def running?
    !@thread.nil? && @thread.alive?
  end

  protected

  def gets
    @output_buffer.gets
  end

  def puts(command)
    @input_buffer.puts(command)
  end

end
