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
      if ['k', 'p', 'r'].include?(command_parts[0]) && script_name = command_parts[1]
        unless running?(script_name)
          @bridge.output_buffer.puts "\nScript: '#{script_name}' is not running.."
          return
        end
        case command_parts[0]
          when 'k'
            kill(script_name)
          when 'p'
            if paused?(script_name)
              @bridge.output_buffer.puts "\nScript: '#{script_name}' is already paused.."
              return
            end
            pause(script_name)
          when 'r'
            unless paused?(script_name)
              @bridge.output_buffer.puts "\nScript: '#{script_name}' is already running.."
              return
            end
            resume(script_name)
        end
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
        script_class_name = "#{script_name.split('_').map(&:capitalize).join}Script"
        script_object = Object::const_get(script_class_name).new(
          @config,
          @bridge,
          :on_exec => lambda {@bridge.output_buffer.puts "\nScript: '#{script_name}' executing.."},
          :on_exit => lambda {@bridge.output_buffer.puts "\nScript: '#{script_name}' exited.."},
          :on_kill => lambda {@bridge.output_buffer.puts "\nScript: '#{script_name}' killed.."},
          :on_pause => lambda {@bridge.output_buffer.puts "\nScript: '#{script_name}' paused.."},
          :on_resume => lambda {@bridge.output_buffer.puts "\nScript: '#{script_name}' resumed.."}
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

  def pause(script_name)
    script_object = @scripts[script_name]
    script_object.pause unless script_object.nil?
  end

  def paused?(script_name)
    @scripts[script_name] && @scripts[script_name].paused?
  end

  def resume(script_name)
    script_object = @scripts[script_name]
    script_object.resume unless script_object.nil?
  end

  def running?(script_name)
    @scripts[script_name] && @scripts[script_name].running?
  end

  def store(script_name, script_object)
    @scripts[script_name] = script_object
  end

end
