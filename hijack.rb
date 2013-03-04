#!/usr/bin/env ruby
require 'thread'
config = {}
ARGV.each {|arg| config[/--(\w+)=/.match(arg).captures.first] = /--\w+=(\w+)/.match(arg).captures.first if arg =~ /--\w+=\w+/}
abort('You must specify a "bridge"') unless config.has_key?('bridge')
bridge_name = config['bridge']
bridge_file_path = "./bridge/#{bridge_name}.rb"
abort("Bridge: \"#{bridge_name}\" does not exist..") unless File.exist?(bridge_file_path)
load bridge_file_path
bridge_class_name = bridge_name.split('_').each {|w| w.capitalize!}.join + 'Bridge'
bridge = Object::const_get(bridge_class_name).new(config)
abort("Bridge: \"#{bridge_name}\" is missing one or more required arguments: #{bridge.required_arguments.join(', ')}") if bridge.required_arguments.any? {|a| config[a].nil?}
bridge.connect!
abort("A connection through Bridge: \"#{bridge_name}\" could not be established") unless bridge.connected?
running = true
Thread.new {
	while output = bridge.gets.chomp
		unless output.empty?
			STDOUT.puts output
		end
	end
}
Thread.new {
	while input = STDIN.gets.chomp
		unless input.empty?
			bridge.puts input
			running = false if input =~ /\A(exit|quit)\Z/
		end
	end
}
while running
	sleep(0.25)
end
