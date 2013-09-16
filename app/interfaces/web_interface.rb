require 'sinatra/base'

class WebInterface < Sinatra::Base

  include BridgeHelpers
  include ConfigHelpers

  configure do
    set :server => ENV['SERVER'] || 'thin'
  end

  get '/gets' do
    # TODO: Implement me!
  end

  post '/connect' do
    # TODO: Implement me!
  end

  post '/puts' do
    # TODO: Implement me!
  end

  run! if $0 == __FILE__

end

