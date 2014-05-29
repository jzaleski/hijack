# contains all of the logic necessary to validate configuration and connect to
# an end-point
class CommandLineInterface

  def run
    # instantiate a "ConfigHelper" instance, this object provides helper methods
    # for parsing various types of configuration
    config_helper = ConfigHelper.new

    # process args first, they will either contain all the necessary arguments
    # or specify a path to a "config-file" value that has all of the necessary
    # values to construct a bridge
    config = config_helper.process_args(ARGV)

    # try to process the "config-file" (if specified)
    config_file = config[:config_file]
    config.merge!(config_helper.process_config_file(config_file)) \
      if config_file && File.exists?(config_file)

    # instantiate a "BridgeHelper" instance, this object provides helper methods
    # for parsing/validating arguments and constructing bridge instances
    bridge_helper = BridgeHelper.new

    # construct the bridge instance (this can raise an error if there is a load
    # error or if there are missing required arguments)
    bridge = bridge_helper.construct_bridge(config)

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

  def start_read(bridge)
    @read_thread ||= Thread.new do
      while bridge.connected?
        output = bridge.gets
        unless output.blank?
          STDOUT.puts(output)
        end
      end
    end
  end

  def start_write(bridge)
    @write_thread ||= Thread.new do
      while bridge.connected?
        input = STDIN.gets.chomp
        unless input.blank?
          if input =~ /\A(exit|quit)\Z/
            bridge.disconnect($1)
          else
            bridge.puts(input)
          end
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
