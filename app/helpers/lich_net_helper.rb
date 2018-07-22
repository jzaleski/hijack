class LichNetHelper
  CHANNEL = 'channel'
  CHAT = 'chat'
  CHAT_TO = 'chat_to'
  EXIT_QUIT = /exit|quit/
  FROM = 'from'
  LNET = 'LNet'
  LOGIN = 'login'
  MESSAGE = 'message'
  PING = 'ping'
  PRIVATE = 'private'
  PRIVATETO = 'privateto'
  SERVER = 'server'
  TO = 'to'
  TUNE = 'tune'
  TYPE = 'type'
  UNTUNE = 'untune'

  CHANNEL_MESSAGE_FORMAT = '[%s] %s: "%s"'
  CHANNEL_WITHOUT_PREFIX_FORMAT = %{#{LNET}:%s}
  PRIVATETO_MESSAGE_FORMAT = %{[#{LNET}:PrivateTo] %s: "%s"}
  PRIVATE_MESSAGE_FORMAT = %{[#{LNET}:Private] %s: "%s"}
  SERVER_MESSAGE_FORMAT = %{[#{LNET}:Server] %s}

  DEFAULT_CERTIFICATE_FILE_PATH = "#{CONFIG_DIR}/lich_net.cert"
  DEFAULT_CHANNEL = LNET
  DEFAULT_CLIENT_VERSION = '1.4'
  DEFAULT_HOST = 'lnet.lichproject.org'
  DEFAULT_LICH_VERSION = '4.3.12'
  DEFAULT_OUTPUT_FORMAT = '%s'
  DEFAULT_PORT = 7155

  def initialize(config)
    @game = config[:game]
    @name = config[:name]
    @channel = config[:channel] || DEFAULT_CHANNEL
    @host = config[:host] || DEFAULT_HOST
    @port = config[:port].to_s =~ /\A(\d+)\Z/ ? $1.to_i : DEFAULT_PORT
    @client_version = config[:client_version] || DEFAULT_CLIENT_VERSION
    @lich_version = config[:lich_version] || DEFAULT_LICH_VERSION
    @stdin = config[:stdin] || STDIN
    @stdout = config[:stdout] || STDOUT
    @stderr = config[:stderr] || STDERR
    @output_format = config[:output_format] || DEFAULT_OUTPUT_FORMAT
    @certificate_file_path = config[:certificate_file_path] || \
      DEFAULT_CERTIFICATE_FILE_PATH
    @debug = config.debug?
  end

  def connect
    validate_args
    initialize_network
    login
    initialize_threads
    tune(@channel)
  end

  def connected?
    @ssl_socket.present? &&
      !@ssl_socket.closed?
  end

  def disconnect
    @ssl_socket.close rescue nil
    @ssl_socket = nil
  end

  private

  def chat(message)
    if message.present?
      write(MESSAGE, {
        :type => CHANNEL,
        :channel => @channel,
        :message => message,
      })
    end
  end

  def chat_to(to, message)
    if [to, message].all?(&:present?)
      write(MESSAGE, {
        :type => PRIVATE,
        :to => to,
        :message => message,
      })
    end
  end

  def debug?
    !!@debug
  end

  def initialize_certificate
    @certificate ||= OpenSSL::X509::Certificate.new(File.read(@certificate_file_path))
  end

  def initialize_certificate_store
    @certificate_store ||= begin
      certificate_store = OpenSSL::X509::Store.new
      certificate_store.add_cert(@certificate)
      certificate_store
    end
  end

  def initialize_network
    initialize_certificate
    initialize_certificate_store
    initialize_tcp_socket
    initialize_ssl_context
    initialize_ssl_socket
  end

  def initialize_ping_thread
    @ping_thread ||= Thread.new do
      while connected?
        write(PING) if (Time.now - @last_write) >= 60
        sleep 1.0
      end
    end
  end

  def initialize_read_thread
    @read_thread ||= Thread.new do
      while connected?
        ((read rescue nil) || []).each do |value|
          @stdout.puts(@output_format % value)
        end
      end
    end
  end

  def initialize_ssl_context
    @ssl_context ||= begin
      ssl_context = OpenSSL::SSL::SSLContext.new
      ssl_context.cert_store = @certificate_store
      ssl_context.options = (OpenSSL::SSL::OP_NO_SSLv2 + OpenSSL::SSL::OP_NO_SSLv3)
      ssl_context.verify_mode = OpenSSL::SSL::VERIFY_PEER
      ssl_context
    end
  end

  def initialize_ssl_socket
    @ssl_socket ||= begin
      ssl_socket = OpenSSL::SSL::SSLSocket.new(@tcp_socket, @ssl_context)
      ssl_socket.sync_close = true
      ssl_socket.connect
      ssl_socket
    end
  end

  def initialize_tcp_socket
    @tcp_socket ||= begin
      tcp_socket = TCPSocket.open(@host, @port)
      tcp_socket.sync = true
      tcp_socket
    end
  end

  def initialize_threads
    initialize_read_thread
    initialize_write_thread
    initialize_ping_thread
  end

  def initialize_write_thread
    @write_thread ||= Thread.new do
      while connected?
        value = @stdin.gets.rstrip
        value_parts = value.split(' ')
        command = value_parts[0]
        case command
        when CHAT
          # format: chat <message>
          chat(value_parts[1..-1].join(' '))
        when CHAT_TO
          # format: chat_to <to> <message>
          chat_to(value_parts[1], value_parts[2..-1].join(' '))
        when EXIT_QUIT
          # format: exit|quit
          disconnect
        when TUNE
          # format: tune <channel>
          tune(value_parts[1])
        when UNTUNE
          # format: untune <channel>
          untune(value_parts[1])
        else
          @stderr.puts(@output_format % \
            %{#{LichNetHelper}: unexpected command: "#{command}"})
        end
      end
    end
  end

  def login
    write(LOGIN, {
      :game => @game,
      :name => @name,
      :client => @client_version,
      :lich => @lich_version,
    })
  end

  def map_and_filter_messages(document)
    (document.elements || []).map do |element|
      if element.name == MESSAGE
        channel = element.attributes[CHANNEL]
        if channel.present? && !channel.include?(LNET)
          channel = CHANNEL_WITHOUT_PREFIX_FORMAT % channel
        end
        from = element.attributes[FROM]
        text = element.text
        to = element.attributes[TO]
        type = element.attributes[TYPE]
        case type
        when CHANNEL
          CHANNEL_MESSAGE_FORMAT % [
            channel,
            from,
            text,
          ]
        when PRIVATETO
          PRIVATETO_MESSAGE_FORMAT % [
            to,
            text,
          ]
        when PRIVATE
          PRIVATE_MESSAGE_FORMAT % [
            from,
            text,
          ]
        when SERVER
          SERVER_MESSAGE_FORMAT % text
        else
          @stderr.puts(@output_format % \
            %{#{LichNetHelper}: unexpected message-type: "#{type}"})
          nil
        end
      end
    end.compact
  end

  def read
    begin
      value = @ssl_socket.gets
      document = REXML::Document.new(value)
      map_and_filter_messages(document)
    rescue REXML::ParseException => e
      @stderr.puts(@output_format % [
        "#{e.class}: #{e.message}",
        e.backtrace.map { |line| "\tfrom #{line}" }.join("\n")
      ].join("\n")) if debug?
    end
  end

  def tune(channel)
    if channel.present?
      write(TUNE, {
        :channel => @channel = channel,
      })
    end
  end

  def untune(channel)
    if channel.present?
      write(UNTUNE, {
        :channel => channel,
      })
    end
  end

  def validate_args
    if [@game, @name].any?(&:blank?)
      raise \
        %{"#{LichNetHelper}" is missing one or more required configuration values}
    end
  end

  def write(tag, attributes={})
    document = REXML::Document.new
    element = document.add_element(tag)
    element.text = attributes.delete(:message)
    attributes.each { |key, value| element.add_attribute(key.to_s, value) }
    @ssl_socket.puts(document)
    @last_write = Time.now
    nil
  end
end

if $0 == __FILE__
  lichnet_helper = LichNetHelper.new(
    :game => ENV['GAME'],
    :name => ENV['NAME'],
    :channel => ENV['CHANNEL'],
    :host => ENV['HOST'],
    :port => ENV['PORT'],
    :client_version => ENV['CLIENT_VERSION'],
    :lich_version => ENV['LICH_VERSION'],
    :output_format => ENV['OUTPUT_FORMAT'],
    :certificate_file_path => ENV['CERTIFICATE_FILE_PATH'],
    :debug => ENV['DEBUG']
  )
  lichnet_helper.connect.join
end
