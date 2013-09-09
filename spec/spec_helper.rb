# require(s)
require 'rspec'

# configure RSpec
RSpec.configure do |config|
  config.color_enabled = true
  config.requires = ['./config/environment']
end
