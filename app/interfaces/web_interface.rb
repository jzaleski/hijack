require 'sinatra/base'

class WebInterface < Sinatra::Base

  configure do
    set :connections, {}
    set :root, ROOT_DIR
    enable :sessions
  end

  helpers do

    def request_data
      request.body.read.rstrip
    end

    def session_id
      session['session_id']
    end

  end

  get '/' do
    send_file File.join(settings.public_folder, 'index.html')
  end

  get '/gets' do
    settings.connections[session_id].gets
  end

  post '/connect' do
    config_helper = ConfigHelper.new
    config = config_helper.process_json(request_data)
    bridge_helper = BridgeHelper.new
    begin
      bridge = bridge_helper.construct_bridge(config)
    rescue Exception => e
      halt 400, e.message
    end
    begin
      bridge.connect
    rescue Exception => e
      halt 500, e.message
    end
    begin
      bridge.start_buffering
    rescue Exception => e
      halt 500, e.message
    end
    settings.connections[session_id] = bridge
    nil
  end

  post '/disconnect' do
    bridge = settings.connections.delete(session_id)
    bridge.disconnect(request_data) unless bridge.nil?
    nil
  end

  post '/puts' do
    input = request_data
    settings.connections[session_id].puts(input) unless input.empty?
    nil
  end

  run! if $0 == __FILE__

end
