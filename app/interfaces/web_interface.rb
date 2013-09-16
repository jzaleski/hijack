require 'sinatra/base'

class WebInterface < Sinatra::Base

  configure do
    set :root, ENV['ROOT'] || ROOT_DIR
  end

  get '/' do
    send_file File.join(settings.public_folder, 'index.html')
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
