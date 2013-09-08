require 'bridges/base/base_bridge'

class BaseSimutronicsBridge < BaseBridge

  def initialize(config)
    super
    @config.merge!({
      :allowed_command_frequency_ms => 200,
      :login_host => 'eaccess.play.net',
      :login_port => 7900,
    })
  end

  def required_arguments
    [:account, :password, :character]
  end

  def connect
    login
    @socket = TCPSocket.new(@config[:game_host], @config[:game_port])
    @socket.puts "#{@config[:character_key]}\n\n"
  end

  def gets
    raw_output = super
    raw_output.gsub!(/\e\[(1|0)m/, '') if RUBY_PLATFORM =~ /mingw32/
    parsed_output = raw_output.chomp
    parsed_output.insert(parsed_output.index('>') + 1, "\n") if parsed_output =~ /[a-zA-Z]*>.*/
    parsed_output.slice!(0..parsed_output.index('>')) if parsed_output.include?('>')
    "#{(can_fit_on_line?(parsed_output) ? parsed_output : multi_line_output(raw_output)).rstrip}\n"
  end

  private

  def can_fit_on_line?(*values)
    values.join.gsub(/\e\[(1|0)m/, '').length <= LayoutManager.num_cols
  end

  def login
    login_socket = TCPSocket.new(@config[:login_host], @config[:login_port])
    login_socket.puts 'K'
    hash_key_character_codes = login_socket.gets.bytes.to_a
    password_character_codes = @config[:password].bytes.to_a
    password_character_codes.each_index {|i| password_character_codes[i] = ((password_character_codes[i] - 32) ^ hash_key_character_codes[i]) + 32}
    hashed_password = password_character_codes.map(&:chr).join
    login_socket.puts "A\t#{@config[:account]}\t#{hashed_password}\n"
    login_response = login_socket.gets
    abort('Cancelled account and/or invalid account/password specified') if !login_response || login_response =~ /REJECT/
    login_key = /KEY\t([^\t]+)\t/.match(login_response).captures.first
    login_socket.puts 'M'
    login_socket.gets
    login_socket.puts "F\t#{@config[:game_code]}"
    login_socket.gets
    login_socket.puts "G\t#{@config[:game_code]}"
    login_socket.gets
    login_socket.puts "P\t#{@config[:game_code]}"
    login_socket.gets
    login_socket.puts 'C'
    character_login_response = login_socket.gets.split
    abort('Invalid character name specified') unless character_login_response && character_login_response.include?(@config[:character])
    login_socket.puts "L\t#{character_login_response[character_login_response.index(@config[:character]) - 1]}\tSTORM"
    character_key_response = login_socket.gets
    login_socket.close unless login_socket.closed?
    abort('Could not connect to server') unless character_key_response =~ /KEY=\w+/
    @config[:character_key] = /KEY=(\w+)$/.match(character_key_response).captures.first
  end

  def multi_line_output(value)
    buffer, temp = ['', '']
    for word in value.split
      word.chomp!
      if word =~ /[a-zA-Z]*>/
        word.insert(word.index('>') + 1, "\n")
        word.sub!(/[a-zA-Z]*>/, '')
      end
      unless can_fit_on_line?(word, temp)
        buffer << "#{temp.rstrip}\n"
        temp = ''
      end
      temp << "#{word} "
    end
    "#{buffer}#{temp}"
  end

end
