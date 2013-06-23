class ScriptManager

  def initialize(config, bridge, callback_manager)
    @config = config
    @bridge = bridge
    @scripts = {}
  end

  # TODO: clean-up this method
  def execute(command)
    unless command.empty?
      command_parts = command.split
      if command_parts[0] == 'k' && script_name = command_parts[1]
        unless running?(script_name)
          @bridge.output_buffer.puts "\nScript: '#{script_name}' is not running.."
          return
        end
        kill(script_name)
      elsif script_name = command_parts[0]
        if running?(script_name)
          @bridge.output_buffer.puts "\nScript: '#{script_name}' is already running.."
          return
        end
        script_path = [
          "#{SCRIPT_DIR}/#{@config[:script_dir]}/#{script_name}_script.rb",
          "#{SCRIPT_DIR}/share/#{script_name}_script.rb",
        ].find {|script_file| File.exist?(script_file)}
        unless script_path
          @bridge.output_buffer.puts "\nScript: '#{script_name}' does not exist.."
          return
        end
        load script_path
        script_class_name = script_name.split('_').each {|w| w.capitalize!}.join + 'Script'
        script_object = Object::const_get(script_class_name).new(
          @config,
          @bridge,
          lambda {@bridge.output_buffer.puts "\nScript: '#{script_name}' executing.."},
          lambda {@bridge.output_buffer.puts "\nScript: '#{script_name}' exited.."},
          lambda {@bridge.output_buffer.puts "\nScript: '#{script_name}' killed.."}
        )
        unless script_object.nil?
          args = command_parts[1..-1]
          unless script_object.validate_args(args)
            @bridge.output_buffer.puts "\nScript: '#{script_name}' was invoked with invalid arguments.."
            return
          end
          script_object.start_run(args)
          store(
            script_name,
            script_object
          )
        end
      end
    end
  end

  private

  def kill(script_name)
    script_object = @scripts.delete(script_name)
    script_object.kill unless script_object.nil?
  end

  def store(script_name, script_object)
    @scripts[script_name] = script_object
  end

  def running?(script_name)
    @scripts[script_name] && @scripts[script_name].running?
  end

end
