source 'https://rubygems.org'

if ENV['HEROKU']
  ruby '2.2.3', :engine => 'jruby', :engine_version => '9.0.5.0'
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
