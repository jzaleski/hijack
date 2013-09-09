require 'sinatra'

set :server => ENV['SERVER'] || 'thin'

get '/gets' do; end

post '/connect' do; end

post '/puts' do; end
