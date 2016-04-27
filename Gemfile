source 'https://rubygems.org'

custom_ruby_version = ENV['CUSTOM_RUBY_VERSION']
if !custom_ruby_version.nil?
  ruby custom_ruby_version
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
