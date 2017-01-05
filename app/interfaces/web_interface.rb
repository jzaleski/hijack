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

    def json_data(data)
      jsonify({:data => data})
    end

    def json_success
      jsonify({:success => true})
    end

    def jsonify(value)
      value.to_json
    end

    def request_text
      request.body.read.rstrip
    end

    def session_id
      session['session_id']
    end

    def set_connection(connection)
      settings.connections[session_id] = connection
    end
  end

  get '/' do
    content_type :html
    send_file File.join(settings.public_folder, 'index.html')
  end

  get '/bridges' do
    content_type :json
    jsonify(bridge_helper.available_bridges(request[:game]))
  end

  get '/games' do
    content_type :json
    jsonify(game_helper.available_games)
  end

  get '/gets' do
    content_type :json
    if current_bridge.nil?
      halt 400, "Couldn't read from `Bridge`"
    end
    json_data(htmlify(current_bridge.gets))
  end

  post '/connect' do
    content_type :json
    begin
      config = config_helper.process_hash(JSON::parse(request_text))
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
    json_success
  end

  post '/disconnect' do
    content_type :json
    if current_bridge.nil?
      halt 400, "Couldn't disconnect from `Bridge`"
    end
    current_bridge.disconnect(request_text)
    json_success
  end

  post '/puts' do
    content_type :json
    if current_bridge.nil?
      halt 400, "Couldn't write to `Bridge`"
    end
    input = request_text
    current_bridge.puts(input) unless input.blank?
    json_success
  end

  post '/reconnect' do
    content_type :json
    if !can_reconnect_session?
      halt 400, "Couldn't reconnect to `Session`"
    end
    json_success
  end

  run! if $0 == __FILE__
end
