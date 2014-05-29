require 'bridges/base/base_bridge'

class BaseSimutronicsBridge < BaseBridge

  SORRY_YOU_MAY_ONLY_TYPE_AHEAD = 'Sorry, you may only type ahead'
  WAIT = '\.\.\.wait'

  RETRY_PATTERN = [
    SORRY_YOU_MAY_ONLY_TYPE_AHEAD,
    WAIT,
  ].join('|')

  def initialize(config)
    super
    @config.merge!({
      :login_host => 'eaccess.play.net',
      :login_port => 7900,
    })
  end

  def self.required_args
    [:account, :password, :character]
  end

  def connect
    login
    @socket = TCPSocket.new(@config[:game_host], @config[:game_port])
    @socket.sync = true
    @socket.puts "#{@config[:character_key]}\n\n"
  end

  def gets
    # perform all operations on a copy of the original string
    str = super.dup
    # attempt to fix the player-status prompt
    str.gsub!(/>(\s*)(\S)/, ">\n\\1\\2")
    # remove the player-status prompt (if configured to do so)
    str.gsub!(/\A(\e\[[\d;]+m|\w|!)*>/, '') if strip_player_status_prompt?
    # ensure that ANSI escape sequences are terminated
    str << "\e[0m" if str.match(/\e\[[\d;]+m/) && !str.match(/\e\[\0m/)
    # remove all ANSI escape sequences (if configured to do so)
    str.gsub!(/\e\[[\d;]+m/, '') if @layout_helper.strip_ansi_escape_sequences?
    # wrap the line if necessary (and append a LF)
    str = "#{can_fit_on_one_line?(str) ? str : multi_line_output(str)}\n"
    # an empty string will not be output
    should_output?(str) ? str : ''
  end

  protected

  attr_reader :socket

  private

  def can_fit_on_one_line?(*strs)
    strs.join(' ').gsub(/\e\[[\d;]+m/, '').length <= @layout_helper.num_cols
  end

  def login
    login_socket = TCPSocket.new(@config[:login_host], @config[:login_port])
    login_socket.puts "K\n"
    hash_key_character_codes = login_socket.gets.bytes.to_a
    password_character_codes = @config[:password].bytes.to_a
    password_character_codes.each_index \
      {|i| password_character_codes[i] = ((password_character_codes[i] - 32) ^ hash_key_character_codes[i]) + 32}
    hashed_password = password_character_codes.map(&:chr).join
    login_socket.puts "A\t#{@config[:account]}\t#{hashed_password}\n"
    login_response = login_socket.gets
    if \
      login_response.blank? ||
      login_response =~ /REJECT/ ||
      (/KEY\t([^\t]+)\t/.match(login_response).captures.first rescue nil).nil?
      abort('Cancelled account and/or invalid account/password specified')
    end
    login_socket.puts "M\n"
    login_socket.gets
    login_socket.puts "F\t#{@config[:game_code]}\n"
    login_socket.gets
    login_socket.puts "G\t#{@config[:game_code]}\n"
    login_socket.gets
    login_socket.puts "P\t#{@config[:game_code]}\n"
    login_socket.gets
    login_socket.puts "C\n"
    character_login_response = login_socket.gets.split
    abort('Invalid character name specified') \
      unless character_login_response && character_login_response.include?(@config[:character])
    login_socket.puts "L\t#{character_login_response[character_login_response.index(@config[:character]) - 1]}\tSTORM\n"
    character_key_response = login_socket.gets
    login_socket.close unless login_socket.closed?
    abort('Could not connect to server') unless character_key_response =~ /KEY=\w+/
    @config[:character_key] = /KEY=(\w+)$/.match(character_key_response).captures.first
  end

  def multi_line_output(str)
    buffer, temp = ["", ""]
    for word in str.split(/ /)
      word.gchomp!(' ')
      unless can_fit_on_one_line?(word, temp)
        buffer << "#{temp.gchomp(' ')}\n"
        temp = ""
      end
      temp << "#{word} "
    end
    "#{buffer}#{temp.gchomp(' ')}"
  end

  def retryable?(str)
    str.match(RETRY_PATTERN)
  end

  def scripts_running?
    @script_helper.num_running_non_paused > 0
  end

  def should_output?(str)
    !(retryable?(str) && scripts_running? && strip_retryable_output?)
  end

  def strip_player_status_prompt?
    @config[:strip_player_status_prompt].to_s == 'true'
  end

  def strip_retryable_output?
    @config[:strip_retryable_output].to_s == 'true'
  end

end
