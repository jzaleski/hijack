module Kernel
  # a `Hash` to store the last-modified times for files we want to auto-reload
  @@last_modified_times_by_file_path = {}

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

  def load_reload(name)
    # call the `load` method override with the `reload` flag set to `true` this
    # will result in files being auto-reloaded if there have been changes to the
    # file since it was originally loaded
    load(name, true)
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

  def require_reload(name)
    # call the `require` method override with the `reload` flag set to `true`
    # this will result in files being auto-reloaded if there have been changes
    # to the file since it was originally loaded
    require(name, true)
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
    # if the file-path doesn't end w/ the expected extension, append it
    file_path = (name !~ /\.rb\Z/) ? "#{name}.rb" : name
    # capture the modified timestamp of the file
    last_modified_time = File.mtime(file_path)
    # attempt to fetch the previous modified timestamp from the `Hash` if one is
    # not found, return the current modified timestamp from above as the default
    stored_last_modified_time = @@last_modified_times_by_file_path.
      fetch(file_path, last_modified_time)
    # skip a key check and always write the current timestamp
    @@last_modified_times_by_file_path[file_path] = last_modified_time
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
