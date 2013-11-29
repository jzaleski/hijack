class ScriptHelper

  def initialize(config, bridge, input_buffer, output_buffer, callback_helper)
    @config = config
    @bridge = bridge
    @input_buffer = input_buffer
    @output_buffer = output_buffer
    @callback_helper = callback_helper
    @arguments_helper = ArgumentsHelper.new
    @scripts = {}
  end

  def execute(command)
    unless command.empty?
      command_parts = command.split
      if command_parts[0] == 'ka'
        kill_all
      elsif command_parts[0] == 'pa'
        pause_all
      elsif command_parts[0] == 'ra'
        resume_all
      elsif command_parts[0] == 'l'
        list_running
      elsif command_parts[0] == 'k' && script_name = command_parts[1]
        kill(script_name)
      elsif command_parts[0] == 'p' && script_name = command_parts[1]
        pause(script_name)
      elsif command_parts[0] == 'r' && script_name = command_parts[1]
        resume(script_name)
      elsif script_name = command_parts[0]
        if running?(script_name)
          @output_buffer.puts "\nScript: '#{script_name}' is already running.."
          return
        end
        script_dir = @config[:script_dir]
        location = @config[:location]
        possible_script_paths = []
        if script_dir
          if location
            possible_script_paths << \
              "#{SCRIPTS_DIR}/#{script_dir}/#{location}/#{script_name}_script.rb"
          end
          possible_script_paths << \
            "#{SCRIPTS_DIR}/#{script_dir}/#{script_name}_script.rb"
        end
        possible_script_paths << \
          "#{SCRIPTS_DIR}/share/#{script_name}_script.rb"
        script_path = \
          possible_script_paths.detect {|script_file| File.exist?(script_file)}
        unless script_path
          @output_buffer.puts "\nScript: '#{script_name}' does not exist.."
          return
        end
        begin
          load script_path
        rescue Exception => e
          backtrace = e.backtrace.map {|line| "\tfrom #{line}"}.join("\n")
          STDERR.puts "\n#{e.class}: #{e.message}\n#{backtrace}"
          return
        end
        script_class_name = \
          "#{script_name.split('_').map(&:capitalize).join}Script"
        script_object = Object::const_get(script_class_name).new(
          @config,
          @bridge,
          @callback_helper,
          :on_exec => lambda do
            @output_buffer.puts "\nScript: '#{script_name}' executing.."
          end,
          :on_exit => lambda do
            delete(script_name)
            @output_buffer.puts "\nScript: '#{script_name}' exited.."
          end,
          :on_kill => lambda do
            delete(script_name)
            @output_buffer.puts "\nScript: '#{script_name}' killed.."
          end,
          :on_pause => lambda do
            @output_buffer.puts "\nScript: '#{script_name}' paused.."
          end,
          :on_resume => lambda do
            @output_buffer.puts "\nScript: '#{script_name}' resumed.."
          end
        )
        unless script_object.nil?
          # strip out the "script_name" and leading/trailing whitespace before
          # attempting to parse the args out of the string
          args = @arguments_helper.parse(command.sub(script_name, '').strip)
          unless script_object.validate_args(args)
            @output_buffer.puts \
              "\nScript: '#{script_name}' was invoked with invalid arguments.."
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

  def num_running_non_paused
    @scripts.values.count do |script_object|
      script_object.running? && !script_object.paused?
    end
  end

  private

  def delete(script_name)
    if @scripts.include?(script_name)
      @scripts.delete(script_name)
    end
  end

  def kill(script_name)
    script_object = @scripts[script_name]
    if script_object.nil?
      @output_buffer.puts "\nscript: '#{script_name}' is not running.."
      return
    end
    script_object.kill
  end

  def kill_all
    @scripts.keys.each do |script_name|
      kill(script_name)
    end
  end

  def list_running
    script_names = @scripts.keys
    if script_names.empty?
      running_scripts = '(none)'
    else
      running_scripts = script_names.sort.map do |script_name|
        "- #{script_name} (#{@scripts[script_name].status})"
      end.join("\n")
    end
    @output_buffer.puts \
      "\nRunning scripts:\n================\n\n#{running_scripts}"
  end

  def pause(script_name)
    script_object = @scripts[script_name]
    if script_object.nil?
      @output_buffer.puts "\nscript: '#{script_name}' is not running.."
      return
    end
    if script_object.paused?
      @output_buffer.puts "\nScript: '#{script_name}' is already paused.."
      return
    end
    script_object.pause
  end

  def pause_all
    @scripts.keys.each do |script_name|
      pause(script_name)
    end
  end

  def paused?(script_name)
    script_object = @scripts[script_name]
    script_object && script_object.paused?
  end

  def resume(script_name)
    script_object = @scripts[script_name]
    if script_object.nil?
      @output_buffer.puts "\nscript: '#{script_name}' is not running.."
      return
    end
    unless script_object.paused?
      @output_buffer.puts "\nScript: '#{script_name}' is already running.."
      return
    end
    script_object.resume
  end

  def resume_all
    @scripts.keys.each do |script_name|
      resume(script_name)
    end
  end

  def running?(script_name)
    script_object = @scripts[script_name]
    script_object && script_object.running?
  end

  def store(script_name, script_object)
    unless script_name.nil? || script_object.nil?
      @scripts[script_name] = script_object
    end
  end

end
