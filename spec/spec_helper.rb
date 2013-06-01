require 'rspec'

# Load the environment file
require File.expand_path(File.dirname(__FILE__) + '/../config/environment')

# Configure RSpec
RSpec.configure do |config|
  config.color_enabled = true
end
