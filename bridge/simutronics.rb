require_relative './base'
class SimutronicsBridge < BaseBridge
	def initialize(config)
		super
		@config.merge!({
			:login_host => 'eaccess.play.net',
			:login_port => 7900,
		})
	end
	def required_arguments
		[:account, :password, :character]
	end
	def connect!
		login!
		@socket = TCPSocket.new(@config[:game_host], @config[:game_port])
		puts "#{@config[:character_key]}\n\n"
	end
	def gets
		raw_output = super
		parsed_output = raw_output.chomp
		return if @previous_line_was_empty and parsed_output.strip.empty?
		@previous_line_was_empty = parsed_output.strip.empty?
		parsed_output.insert(parsed_output.index('>') + 1, "\n") if parsed_output =~ /[a-zA-Z]*>.*/
		parsed_output.slice!(0..parsed_output.index('>')) if parsed_output.include?('>')
		can_fit_on_line?(parsed_output) ? "#{parsed_output.rstrip}\n" : multi_line_output(raw_output.chomp)
	end
	private
	def can_fit_on_line?(*values)
		values.join.gsub(/\e\[(1|0)m/, '').length <= num_cols
	end
	def login!
		login_socket = TCPSocket.new(@config[:login_host], @config[:login_port])
		login_socket.puts 'K'
		hash_key_character_codes = login_socket.gets.bytes.to_a
		password_character_codes = @config[:password].bytes.to_a
		password_character_codes.each_index {|i| password_character_codes[i] = ((password_character_codes[i] - 32) ^ hash_key_character_codes[i]) + 32}
		hashed_password = password_character_codes.map {|c| c.chr}.join
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
		character_login_response = login_socket.gets
		abort('Invalid character name specified') unless character_login_response && character_login_response.include?(@config[:character])
		login_socket.puts "L\t#{character_login_response.split(/\t/)[5]}\tSTORM"
		character_key_response = login_socket.gets
		login_socket.close unless login_socket.closed?
		abort('Could not connect to server') unless character_key_response =~ /KEY=\w+/
		@config[:character_key] = /KEY=(\w+)$/.match(character_key_response).captures.first
	end
	def multi_line_output(value)
		buffer = ''
		temp = ''
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
		"#{buffer}#{temp}\n"
	end
end
