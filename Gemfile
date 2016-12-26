source 'https://rubygems.org'

if ENV['HEROKU']
  ruby '2.3.1', :engine => 'jruby', :engine_version => '9.1.6.0'
end

gem 'pry'
gem 'puma'
gem 'rake'
gem 'sinatra'

group :development do
  gem 'foreman'
end

group :test do
  gem 'rspec'
end
