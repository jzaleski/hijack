# require(s)
require 'rspec'

# configure RSpec
RSpec.configure do |config|
  config.color_enabled = true
  ['./config/environment'].each {|required_module| require required_module}
end
