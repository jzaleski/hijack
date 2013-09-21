#\ -p 4567
require File.expand_path('../config/environment.rb', __FILE__)
require File.expand_path('../app/interfaces/web_interface.rb', __FILE__)
run WebInterface
