class BaseScript

  def initialize(config, bridge, on_exec=nil, on_exit=nil, on_kill=nil)
    @config = config
    @bridge = bridge
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

  def running?
    !@thread.nil? && @thread.alive?
  end

  def validate_args(args)
    true
  end

  protected

  def puts(command, opts={})
    # merge default options
    opts = {:store_command => false}.merge(opts)
    # send the command (and opts) to the bridge
    @bridge.puts(command, opts)
  end

  def wait_for_match(pattern)
    match = nil
    # set the hook
    @bridge.callback_manager.add_match(
      pattern,
      lambda {|m| match = m}
    )
    # sleep on this thread while waiting for the hook to be invoked
    sleep 0.1 until match
    # return the result
    match
  end

end
