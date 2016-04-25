module Kernel
  # rename the original "load" method (it's still used below)
  alias_method :original_load, :load

  def load(name)
    begin
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

  def require(name)
    begin
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
      # translate the [file-]name to the class-name (OS agnostic)
      class_name = name.split(/[\\\/]/)[-1].to_camel_case
      # forcibly unload the previously loaded module
      Object.send(:remove_const, class_name)
      # short-circuit, the exception met the required criteria and was handled
      return true
    end
    # exception was not handled
    false
  end
end
