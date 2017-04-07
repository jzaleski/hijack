class WebInterface < Sinatra::Base
  configure do
    set :connections, Hash.new { |hash, key| hash[key] = {} }
    set :html_transformations, \
      [[/\[0m/, '</strong>'], [/\[1m/, '<strong>'], [/\n/, '<br/>']]
    set :root, ROOT_DIR
    enable :sessions
  end

  helpers do
    def bridge_helper
      @bridge_helper ||= BridgeHelper.new
    end

    def can_reconnect?
      current_config.try(:[], :enable_session_reconnect).to_s == 'true' &&
        current_websocket.nil? &&
        current_bridge.try(:connected?)
    end

    def config_helper
      @config_helper ||= ConfigHelper.new
    end

    def connect(config)
      bridge = bridge_helper.construct_bridge(config)
      bridge.connect
      bridge.start_buffering
      bridge
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

    def current_websocket
      @current_websocket ||= current_connection[:websocket] rescue nil
    end

    def disconnect(str=nil)
      current_bridge.disconnect(str) rescue nil
      reset_connection
      nil
    end

    def disconnect?(str)
      str =~ /\A(exit|quit)\Z/
    end

    def game_helper
      @game_helper ||= GameHelper.new
    end

    def gets
      current_bridge.gets
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

    def puts(str)
      current_bridge.puts(str)
    end

    def reset_connection
      set_connection({})
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

    def set_bridge(bridge)
      settings.connections[session_id][:bridge] = bridge
    end

    def set_config(config)
      settings.connections[session_id][:config] = config
    end

    def set_connection(connection)
      settings.connections[session_id] = {
        :config => nil,
        :bridge => nil,
        :websocket => nil,
      }.merge(connection)
    end

    def set_websocket(websocket)
      settings.connections[session_id][:websocket] = websocket
    end
  end

  before(/\//) do
    content_type :html
  end

  before(/\/[a-z_]+/) do
    content_type :json
  end

  get '/' do
    begin
      send_file File.join(settings.public_folder, 'index.html')
    rescue Exception => e
      halt 500, e.message
    end
  end

  get '/bridges' do
    begin
      response_data(bridge_helper.available_bridges(request[:data]))
    rescue Exception => e
      halt 500, e.message
    end
  end

  get '/connect' do
    halt 403, 'Unsupported scheme' unless request.websocket?
    request.websocket do |websocket|
      set_websocket(websocket)
      websocket.onclose { disconnect }
      websocket.onmessage do |message|
        request_data = (JSON::parse(message) rescue {})['data']
        if current_config.nil?
          connected = false
          config_processed = false
          begin
            config = config_helper.process_hash(request_data)
            set_config(config)
            config_processed = true
          rescue Exception => e
            websocket.send(response_data(e.message))
            websocket.close_websocket
          end
          if config_processed
            begin
              bridge = connect(config)
              set_bridge(bridge)
              connected = true
            rescue Exception => e
              websocket.send(response_data(e.message))
              websocket.close_websocket
            end
          end
          if connected
            Thread.new do
              loop do
                websocket.send(response_data(htmlify(gets)))
              end
            end
          end
        else
          if disconnect?(request_data)
            disconnect(request_data)
          elsif request_data.present?
            puts(request_data)
          end
        end
      end
    end
  end

  get '/games' do
    begin
      response_data(game_helper.available_games)
    rescue Exception => e
      halt 500, e.message
    end
  end

  get '/gets' do
    begin
      response_data(htmlify(gets))
    rescue Exception => e
      halt 500, e.message
    end
  end

  post '/connect' do
    begin
      config = config_helper.process_hash(request[:data])
      set_config(config)
    rescue Exception => e
      halt 400, e.message
    end
    begin
      bridge = connect(config)
      set_bridge(bridge)
    rescue Exception => e
      halt 500, e.message
    end
    response_success
  end

  post '/disconnect' do
    begin
      disconnect(request[:data])
    rescue Exception => e
      halt 500, e.message
    end
    response_success
  end

  post '/puts' do
    begin
      puts(request[:data])
    rescue Exception => e
      halt 500, e.message
    end
    response_success
  end

  post '/reconnect' do
    halt 400, "Can't reconnect" unless can_reconnect?
    response_success
  end

  private

  run! if $0 == __FILE__
end
