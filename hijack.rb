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

# In order to more easily facilitate scripting input & output are buffered in FIFO queues
bridge.start_buffering!

# Read loop
Thread.new {
	while bridge.connected? && output = bridge.gets
		unless output.nil? || output.empty?
			STDOUT.puts output
		end
	end
}

# Write loop
Thread.new {
	while bridge.connected? && input = STDIN.gets.chomp
		unless input.nil? || input.empty?
			bridge.puts input
			bridge.close! if input =~ /\A(exit|quit)\Z/
		end
	end
}

# Spin until we're ready to exit
sleep(0.25) while bridge.connected?
