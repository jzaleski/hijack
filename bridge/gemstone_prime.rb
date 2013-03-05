require_relative './simutronics'
class GemstonePrimeBridge < SimutronicsBridge
	def initialize(config)
		super
		@config.merge!({
			:login_host => 'eaccess.play.net',
			:login_port => 7900,
			:game_host => 'gs3.simutronics.net',
			:game_port => 4900,
			:game_code => 'GS3',
			:script_dir => 'gs',
		})
	end
	def connect!
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
		abort('Could not connect to server') unless character_key_response && character_key_response.include?('KEY=')
		login_socket.close unless login_socket.closed?
		@socket = TCPSocket.new(@config[:game_host], @config[:game_port])
		puts "#{/KEY=(\w+)$/.match(character_key_response).captures.first}\n\n"
	end
end
