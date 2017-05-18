abort 'Cannot run the `WebInterface` on JRuby' if RUBY_PLATFORM =~ /java|jruby/

dirname = File.dirname(__FILE__)
require File.expand_path('config/environment.rb', dirname)
require File.expand_path('app/interfaces/web_interface.rb', dirname)

run WebInterface
