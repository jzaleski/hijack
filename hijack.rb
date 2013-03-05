#!/usr/bin/env ruby

require 'socket'
require 'thread'

# Create a hash out of the args specified on the command-line
config = {}
ARGV.each {|arg| config[/--(\w+)=/.match(arg).captures.first.to_sym] = /--\w+=(\w+)/.match(arg).captures.first if arg =~ /--\w+=\w+/}

# Find and instantiate bridge then, attempt to connect to the game server
abort('You must specify a "bridge"') unless config.has_key?(:bridge)
bridge_name = config[:bridge]
bridge_file_path = "./bridge/#{bridge_name}.rb"
abort("Bridge: \"#{bridge_name}\" does not exist..") unless File.exist?(bridge_file_path)
load bridge_file_path
bridge_class_name = bridge_name.split('_').each {|w| w.capitalize!}.join + 'Bridge'
bridge = Object::const_get(bridge_class_name).new(config)
abort("Bridge: \"#{bridge_name}\" is missing one or more required arguments: #{bridge.required_arguments.join(', ')}") if bridge.required_arguments.any? {|a| config[a].nil?}
bridge.connect!
abort("A connection through Bridge: \"#{bridge_name}\" could not be established") unless bridge.connected?

# XXX: this calculation needs to be performed more often to handle re-size events
num_cols, num_rows = if STDIN.tty? then `stty size`.split.map(&:to_i).reverse else [`tput cols`.to_i, `tput lines`.to_i] end

# set to "false" to exit
running = true

# Read loop: move all of the output code below into the bridge. It should simple read and print output directly from the bridge
Thread.new {
	last_line_was_empty = false
	while raw_output = bridge.gets
		parsed_output = raw_output.chomp
		next if last_line_was_empty and parsed_output.strip.empty?
		last_line_was_empty = parsed_output.strip.empty?
		parsed_output.insert(parsed_output.index('>') + 1, "\n") if parsed_output =~ /[a-zA-Z]*>.*/
		parsed_output.slice!(0..parsed_output.index('>')) if parsed_output.include?('>')
		if parsed_output.gsub(/\e\[(1|0)m/, '').length <= num_cols
			STDOUT.puts parsed_output.rstrip
			next
		end
		parsed_output = raw_output.chomp
		buffer = ''
		for word in parsed_output.split
			word.chomp!
			if word =~ /[a-zA-Z]*>/
				word.insert(word.index('>') + 1, "\n")
				word.sub!(/[a-zA-Z]*>/, '')
			end
			if word.gsub(/\e\[(1|0)m/, '').length + buffer.gsub(/\e\[(1|0)m/, '').length > num_cols
				STDOUT.puts buffer.rstrip
				buffer = ''
			end
			buffer.concat("#{word} ")
		end
		STDOUT.puts buffer.rstrip unless buffer.empty?
	end
}

# Write loop
Thread.new {
	while input = STDIN.gets.chomp
		unless input.empty?
			bridge.puts input
			running = false if input =~ /\A(exit|quit)\Z/
		end
	end
}

# Spin until we're ready to exit
sleep(0.25) while running
