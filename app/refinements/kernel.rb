module Kernel
  # a `Hash` to store the last-modified times for files we want to auto-reload
  @@last_modified_times_by_name = {}

  # rename the original "load" method (it's still used below)
  alias_method :original_load, :load

  def load(name, reload=false)
    begin
      # try to "unload" the module
      unload(name) if reload && should_reload?(name)
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
      unload(name) if reload && should_reload?(name)
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

  def should_reload?(name)
    # capture the modified timestamp of the module
    last_modified_time = File.mtime(name)
    # attempt to fetch the previous modified timestamp from the `Hash` if one is
    # not found, return the current modified timestamp from above as the default
    stored_last_modified_time = @@last_modified_times_by_name.
      fetch(name, last_modified_time)
    # skip a key check and always write the current timestamp
    @@last_modified_times_by_name[name] = last_modified_time
    # return `true` if the stored timestamp is less than the current timestamp
    last_modified_time > stored_last_modified_time
  end

  def unload(name)
    # translate the [file-]name to the class-name (OS agnostic)
    class_name = name.split(/[\\\/]/)[-1].to_camel_case
    # forcibly unload the previously loaded module
    Object.send(:remove_const, class_name) rescue nil
  end
end
