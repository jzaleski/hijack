# require(s)
require 'rspec'

# configure RSpec
RSpec.configure do |config|
  config.color_enabled = true
  ['./config/environment'].each { |required_module| require required_module }
end

# as horrible as this patch may seem, the symptom will only ever happen in test
def require(name)
  begin
    # try to require the module
    super(name)
  rescue TypeError => e
    # only handle a very specific type of "TypeError"
    if e.message =~ /superclass mismatch for class (\S+)/
      # forcibly unload the previously loaded module
      Object.send(:remove_const, $1)
      # now that the module is unloaded, its replacement should load w/o issue
      super(name)
    end
  end
end
