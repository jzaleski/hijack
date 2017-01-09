module Kernel
  # rename the original "load" method (it's still used below)
  alias_method :original_load, :load

  def load(name, reload=false)
    begin
      # try to "unload" the module
      unload(name) if reload
      # try to "load" the module
      original_load(name)
    rescue TypeError => e
      # if the exception was not handled, re-raise the exception
      raise unless handled_exception?(e)
      # now that the module is unloaded, its replacement should load w/o issue
      original_load(name)
    end
  end

  # rename the original "require" method (it's still used below)
  alias_method :original_require, :require

  def require(name, reload=false)
    begin
      # try to "unload" the module
      unload(name) if reload
      # try to "require" the module
      original_require(name)
    rescue TypeError => e
      # if the exception was not handled, re-raise the exception
      raise unless handled_exception?(name, e)
      # now that the module is unloaded, its replacement should load w/o issue
      original_require(name)
    end
  end

  private

  def handled_exception?(name, exception)
    # only handle a very specific type of "TypeError"
    if exception.message =~ /[Ss]uperclass mismatch/
      # this case occurs during testing and with scripts since they same script
      # can exist for multiple towns and they are not [currently] namespaced
      unload(name)
      # short-circuit, the exception met the required criteria and was handled
      return true
    end
    # exception was not handled
    false
  end

  def unload(name)
    # translate the [file-]name to the class-name (OS agnostic)
    class_name = name.split(/[\\\/]/)[-1].to_camel_case
    # forcibly unload the previously loaded module
    Object.send(:remove_const, class_name) rescue nil
  end
end
