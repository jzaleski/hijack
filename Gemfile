source 'https://rubygems.org'

if ENV['HEROKU']
  ruby '2.5.0'
end

gem 'pry', '~> 0.11'
gem 'rake', '~> 12.3'
gem 'rb-readline', '~> 0.5'

if RUBY_PLATFORM !~ /java|jruby/
  gem 'sinatra', '~> 1.4'
  gem 'sinatra-websocket', '~> 0.3'
  gem 'thin', '~> 1.7'
end

group :test do
  gem 'rspec', '~> 3.7'
end
