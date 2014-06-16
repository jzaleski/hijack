class BaseScript

  def initialize(config, bridge, callback_helper, logging_helper, opts={})
    @config = config
    @bridge = bridge
    @callback_helper = callback_helper
    @logging_helper = logging_helper
    @args = opts[:args]
    @on_exec = opts[:on_exec]
    @on_exit = opts[:on_exit]
    @on_kill = opts[:on_kill]
    @on_pause = opts[:on_pause]
    @on_resume = opts[:on_resume]
  end

  def start_run
    if !running?
      @running = true
      @on_exec.call rescue nil
      begin
        run
      rescue Exception => e
        @logging_helper.log_exception_with_backtrace(e)
      end
      @running = false
      @on_exit.call rescue nil
    end
  end

  def kill
    if running?
      @killed = true
      @on_kill.call rescue nil
    end
  end

  def pause
    if !paused?
      @paused = true
      @on_pause.call rescue nil
    end
  end

  def resume
    if paused?
      @paused = false
      @on_resume.call rescue nil
    end
  end

  def run
    raise %{All #{BaseScript}(s) must override the "run" method}
  end

  def exited?
    @running == false
  end

  def killed
    @killed == true
  end

  def paused?
    @paused == true
  end

  def running?
    @running == true
  end

  def sleeping?
    @sleeping == true
  end

  def status
    if paused?
      'paused'
    elsif waiting_for_match?
      'waiting for match'
    elsif sleeping?
      'sleeping'
    elsif killed?
      'killed'
    elsif exited?
      'exited'
    else
      'running'
    end
  end

  def sleep(duration)
    @sleeping = true
    Kernel::sleep(duration)
    @sleeping = false
  end

  def validate_args
    true
  end

  def waiting_for_match?
    @waiting_for_match == true
  end

  protected

  def puts(str, opts={})
    # block here if/while the script is paused
    sleep 0.1 while paused?
    # merge default options
    opts = {:store_command => false}.merge(opts)
    # send the command (and opts) to the bridge
    @bridge.puts(str, opts)
  end

  def wait_for_match(pattern, command=nil)
    # for scoping reasons this must be defined outside of the lambda (below)
    result = nil
    # set the hook
    @callback_helper.add_match(
      pattern,
      lambda {|r| result = r}
    )
    # set "waiting_for_match"
    @waiting_for_match = true
    # now, execute the command, if specified, this must be done after the hook
    # is set
    puts(command) if command
    # sleep on this thread while waiting for the hook to be invoked
    sleep 0.1 until result
    # reset "waiting_for_match"
    @waiting_for_match = false
    # return the result
    result
  end

end
