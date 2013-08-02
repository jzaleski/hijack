#!/usr/bin/env ruby

# Silence warnings by default, but provide an easy means through an environment
# variable to re-enable them if so desired
$VERBOSE = nil unless ENV['VERBOSE']

# Require(s)
require 'socket'
require 'thread'

# Load the environment file
require File.expand_path(File.dirname(__FILE__) + '/../config/environment')

# Instantiate a hash to store all of the parsed config keys/values
config = {}

# Process all of the args specified on the command-line (replace '-' with '_')
ARGV.each do |arg|
  if match_data = /\A--(\S+)=(\S+)\Z/.match(arg)
    config[match_data[1].sub('-', '_').to_sym] = match_data[2]
  end
end

# If the "config-file" argument was specified, and it exists, load and process
# the file (again, replace '-' with '_')
config_file = config.delete(:config_file)
if config_file && File.exist?(config_file)
  File.new(config_file).each_line do |line|
    if match_data = /\A(\S+)\s?=\s?(\S+)\Z/.match(line)
      config[match_data[1].rstrip.sub('-', '_').to_sym] = match_data[2].lstrip
    end
  end
end

# Ensure that the "game" argument is present
game_name = config.delete(:game)
abort('You must specify a "game"') unless game_name

# Ensure that the "bridge" argument is present
bridge_name = config.delete(:bridge)
abort('You must specify a "bridge"') unless bridge_name

# Construct the bridge file-path and verify its existence
bridge_file_path = "#{BRIDGE_DIR}/#{game_name}/#{bridge_name}_bridge.rb"
unless File.exist?(bridge_file_path)
  abort("Bridge: \"#{bridge_name}\" does not exist..")
end

# Load the bridge-file and attempt to instantiate it
load bridge_file_path
bridge_class_name = "#{bridge_name.split('_').map(&:capitalize).join}Bridge"
bridge = Object::const_get(bridge_class_name).new(config)

# Validate all of the necessary arguments, for the bridge, are present
if bridge.required_arguments.any? {|a| config[a].nil?}
  abort("Bridge: \"#{bridge_name}\" is missing one or more required arguments")
end

# Try to connect to the game-host
bridge.connect
unless bridge.connected?
  abort("Bridge: \"#{bridge_name}\" could not connect")
end

# In order to more easily facilitate scripting input & output are buffered in
# FIFO queues
bridge.start_buffering

# Read loop
Thread.new do
  while bridge.connected?
    output = bridge.gets
    unless output.empty?
      STDOUT.puts output
    end
  end
end

# Write loop
Thread.new do
  while bridge.connected?
    input = STDIN.gets.chomp
    unless input.empty?
      bridge.puts input
    end
  end
end

# Spin until we're ready to exit
sleep(0.25) while bridge.connected?
