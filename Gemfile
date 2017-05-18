source 'https://rubygems.org'

if ENV['HEROKU']
  ruby '2.4.0'
end

gem 'pry'
gem 'rake'
gem 'rb-readline'

if RUBY_PLATFORM !~ /java|jruby/
  gem 'sinatra'
  gem 'sinatra-websocket'
  gem 'thin'
end

group :test do
  gem 'rspec'
end
