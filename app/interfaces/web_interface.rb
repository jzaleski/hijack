class WebInterface < Sinatra::Base

  configure do
    set :connections, {}
    set :html_transformations, \
      [[/\[0m/, '</strong>'], [/\[1m/, '<strong>'], [/\n/, '<br/>']]
    set :root, ROOT_DIR
    enable :sessions
  end

  helpers do

    def current_bridge
      @current_bridge ||= current_connection[:bridge] rescue nil
    end

    def current_config
      @current_config ||= current_connection[:config] rescue nil
    end

    def current_connection
      @current_connection ||= settings.connections[session_id]
    end

    def generate_response_data(str)
      output_html? ? htmlify(str) : str
    end

    def htmlify(str)
      # process any HTML escape sequences
      '<pre>%s</pre>' % \
        settings.html_transformations.reduce(str) do |memo, (pattern, replacement)|
          memo.gsub(pattern, replacement)
        end
    end

    def output_html?
      current_config[:output_html] == true
    end

    def request_data
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
    send_file File.join(settings.public_folder, 'index.html')
  end

  get '/gets' do
    generate_response_data(current_bridge.gets) unless current_bridge.nil?
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
    set_connection({
      :bridge => bridge,
      :config => config,
    })
    nil
  end

  post '/disconnect' do
    current_bridge.disconnect(request_data) unless current_bridge.nil?
    nil
  end

  post '/puts' do
    input = request_data
    current_bridge.puts(input) unless current_bridge.nil? || input.blank?
    nil
  end

  run! if $0 == __FILE__

end
