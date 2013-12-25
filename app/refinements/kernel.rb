module Kernel

  # rename the original "require" method (it's still used below)
  alias_method :original_require, :require

  def require(name)
    begin
      # try to require the module
      original_require(name)
    rescue TypeError => e
      # only handle a very specific type of "TypeError"
      if e.message =~ /superclass mismatch for class (\S+)/
        # forcibly unload the previously loaded module
        Object.send(:remove_const, $1)
        # now that the module is unloaded, its replacement should load w/o issue
        original_require(name)
      end
    end
  end

end
