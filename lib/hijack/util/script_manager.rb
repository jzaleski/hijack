class ScriptManager

  def initialize
    @scripts = {}
  end

  def kill(script_name)
    script_object = @scripts.delete(script_name)
    script_object.kill! unless script_object.nil?
  end

  def store(script_name, script_object)
    @scripts[script_name] = script_object
  end

  def running?(script_name)
    @scripts[script_name] && @scripts[script_name].running?
  end

end
