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
      # process any HTML escape sequences
      '<pre>%s</pre>' % \
        settings.html_transformations.reduce(value) do |memo, (pattern, replacement)|
          memo.gsub(pattern, replacement)
        end
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
    content_type :text
    htmlify(current_bridge.gets) unless current_bridge.nil?
  end

  post '/connect' do
    config = config_helper.process_hash(JSON::parse(request_text))
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
    nil
  end

  post '/disconnect' do
    current_bridge.disconnect(request_text) unless current_bridge.nil?
    nil
  end

  post '/puts' do
    input = request_text
    current_bridge.puts(input) unless current_bridge.nil? || input.blank?
    nil
  end

  run! if $0 == __FILE__
end
