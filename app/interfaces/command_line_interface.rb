# contains all of the logic necessary to validate configuration and connect to
# an end-point
class CommandLineInterface

  include BridgeHelpers

  def initialize
    @config = {}
  end

  def run
    # process args first, they will either contain all the necessary arguments
    # or specify a path to a "config-file" value that has all of the necessary
    # values to construct a bridge
    process_args(ARGV)

    # try to process the "config-file" (if specified)
    config_file = @config[:config_file]
    process_config_file(config_file) \
      if config_file && File.exists?(config_file)

    # construct the bridge instance (this can raise an error if there is a load
    # error or if there are missing required arguments)
    bridge = construct_bridge(@config)

    # try to connect to the game-host
    bridge.connect
    # ensure that a connection was successfully established
    abort(%{Bridge: "#{bridge_name}" could not connect}) \
      unless bridge.connected?

    # in order to more easily facilitate scripting input & output are buffered
    bridge.start_buffering

    # start the "read" thread
    start_read(bridge)

    # start the "write" thread
    start_write(bridge)

    # spin until we're ready to exit
    wait_for_exit(bridge)
  end

  private

  def process_args(args)
    (args || []).each do |arg|
      if match_data = /\A--(\S+)=(\S+)\Z/.match(arg)
        @config[match_data[1].gsub(/-/, '_').to_sym] = match_data[2]
      end
    end
  end

  def process_config_file(config_file)
    if config_file && File.exist?(config_file)
      File.new(config_file).each_line do |line|
        # array or hash property (must be valid JSON)
        if match_data = /\A(\S+)\s?=\s?(\[.+\]|\{.+\})\Z/.match(line)
          @config[match_data[1].rstrip.gsub(/-/, '_').to_sym] = \
            JSON::parse(match_data[2].strip, :symbolize_names => true).freeze
        # basic property
        elsif match_data = /\A(\S+)\s?=\s?(\S+)\Z/.match(line)
          @config[match_data[1].rstrip.gsub(/-/, '_').to_sym] = \
            match_data[2].strip
        end
      end
    end
  end

  def start_read(bridge)
    Thread.new do
      while bridge.connected?
        output = bridge.gets
        unless output.empty?
          STDOUT.puts output
        end
      end
    end
  end

  def start_write(bridge)
    Thread.new do
      while bridge.connected?
        input = STDIN.gets.chomp
        unless input.empty?
          bridge.puts input
        end
      end
    end
  end

  def wait_for_exit(bridge)
    sleep 0.25 while bridge.connected?
  end

end

# Application Entry-Point
CommandLineInterface.new.run if $0 == __FILE__
