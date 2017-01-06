class WebInterface < Sinatra::Base
  configure do
    set :connections, {}
    set :html_transformations, \
      [[/\[0m/, '</strong>'], [/\[1m/, '<strong>'], [/\n/, '<br/>']]
    set :root, ROOT_DIR
    enable :sessions
  end

  helpers do
    def bridge_helper
      @bridge_helper ||= BridgeHelper.new
    end

    def can_reconnect_session?
      current_bridge.try(:connected?) &&
        current_config.try(:[], :enable_session_reconnect).to_s == 'true'
    end

    def config_helper
      @config_helper ||= ConfigHelper.new
    end

    def current_bridge
      @current_bridge ||= current_connection[:bridge] rescue nil
    end

    def current_config
      @current_config ||= current_connection[:config] rescue nil
    end

    def current_connection
      @current_connection ||= settings.connections[session_id]
    end

    def game_helper
      @game_helper ||= GameHelper.new
    end

    def htmlify(value)
      '<pre>%s</pre>' % \
        settings.html_transformations.reduce(value) do |memo, (pattern, replacement)|
          memo.gsub(pattern, replacement)
        end
    end

    def jsonify(value)
      value.to_json
    end

    def request_data
      request[:data]
    end

    def response_data(value)
      jsonify({:data => value})
    end

    def response_success
      jsonify({:success => true})
    end

    def session_id
      session['session_id']
    end

    def set_connection(connection)
      settings.connections[session_id] = connection
    end
  end

  before(/\//) do
    content_type :html
  end

  before(/\/[a-z_]+/) do
    content_type :json
  end

  get '/' do
    send_file File.join(settings.public_folder, 'index.html')
  end

  get '/bridges' do
    response_data(bridge_helper.available_bridges(request_data))
  end

  get '/games' do
    response_data(game_helper.available_games)
  end

  get '/gets' do
    halt 400, "Couldn't read from `Bridge`" if current_bridge.nil?
    response_data(htmlify(current_bridge.gets))
  end

  post '/connect' do
    begin
      config = config_helper.process_hash(request_data)
    rescue Exception => e
      halt 400, e.message
    end
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
    set_connection({
      :bridge => bridge,
      :config => config,
    })
    response_success
  end

  post '/disconnect' do
    halt 400, "Couldn't disconnect from `Bridge`" if current_bridge.nil?
    current_bridge.disconnect(request_data)
    response_success
  end

  post '/puts' do
    halt 400, "Couldn't write to `Bridge`" if current_bridge.nil?
    data = request_data
    current_bridge.puts(data) unless data.blank?
    response_success
  end

  post '/reconnect' do
    halt 400, "Couldn't reconnect to `Session`" unless can_reconnect_session?
    response_success
  end

  run! if $0 == __FILE__
end
