class ScriptHelper

  attr_reader :last_script

  def initialize(config, bridge, input_buffer, output_buffer, callback_helper, logging_helper)
    @config = config
    @bridge = bridge
    @input_buffer = input_buffer
    @output_buffer = output_buffer
    @callback_helper = callback_helper
    @logging_helper = logging_helper
    @arguments_helper = ArgumentsHelper.new
    @scripts = {}
    @last_scripts_by_type_name = {}
  end

  def execute(command)
    if command.present?
      command_parts = command.split
      if command_parts[0] == 'ka'
        kill_all
      elsif command_parts[0] == 'pa'
        pause_all
      elsif command_parts[0] == 'ra'
        resume_all
      elsif command_parts[0] == 'la'
        list_available
      elsif command_parts[0] == 'lr'
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
        # this assumes that the directories are already ordered by precedence
        script_path = possible_script_directories.map do |script_directory|
          script_path = script_path(script_directory, script_name)
          File.exist?(script_path) ? script_path : nil
        end.compact.first
        if script_path.nil?
          @output_buffer.puts "\nScript: '#{script_name}' does not exist.."
          return
        end
        begin
          load script_path
        rescue Exception => e
          @logging_helper.log_exception_with_backtrace(e)
          return
        end
        script_class_name = \
          "#{script_name.split('_').map(&:capitalize).join}Script"
        script_object = Object::const_get(script_class_name).new(
          @config,
          @bridge,
          @callback_helper,
          @logging_helper,
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
        if script_object.present?
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
          # update the "last_script" information
          @last_script = script_name
          script_object.class.ancestors[1..-1].each do |ancestor|
            @last_scripts_by_type_name[ancestor.name] = script_name
          end
        end
      end
    end
  end

  def last_script_of_type(type_name)
    @last_scripts_by_type_name[type_name]
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
      @output_buffer.puts "\nScript: '#{script_name}' is not running.."
      return
    end
    script_object.kill
  end

  def kill_all
    @scripts.keys.each do |script_name|
      kill(script_name)
    end
  end

  def list_available
    scripts = possible_script_directories.map do |script_directory|
      Dir["#{script_directory}/*_script.rb"].map do |script_path|
        "- #{/\A.+\/([\w]+)_script\.rb\Z/.match(script_path).captures.first}"
      end
    end.flatten.sort.uniq
    @output_buffer.puts "\nAvailable scripts:\n==================\n\n"
    if scripts.empty?
      @output_buffer.puts '(none)'
    else
      scripts.each { |script| @output_buffer.puts script }
    end
  end

  def list_running
    scripts = @scripts.keys.sort.map do |script_name|
      "- #{script_name} (#{@scripts[script_name].status})"
    end
    @output_buffer.puts "\nRunning scripts:\n================\n\n"
    if scripts.empty?
      @output_buffer.puts '(none)'
    else
      scripts.each { |script| @output_buffer.puts script }
    end
  end

  def pause(script_name)
    script_object = @scripts[script_name]
    if script_object.nil?
      @output_buffer.puts "\nScript: '#{script_name}' is not running.."
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

  def possible_script_directories
    [].tap do |script_directories|
      # [configured] game-specific directory
      if script_dir = @config[:script_dir]
        # location-specific scripts take precedence over game-specific scripts
        (@config[:location].split('|') rescue []).each do |location|
          script_directories << "#{SCRIPTS_DIR}/#{script_dir}/#{location}"
        end
        # game-specific scripts take precedence over shared scripts
        script_directories << "#{SCRIPTS_DIR}/#{script_dir}"
      end
      # lastly, include the shared-directory
      script_directories << "#{SCRIPTS_DIR}/share"
    end
  end

  def resume(script_name)
    script_object = @scripts[script_name]
    if script_object.nil?
      @output_buffer.puts "\nScript: '#{script_name}' is not running.."
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

  def script_path(directory, script_name)
    File.join(directory, "#{script_name}_script.rb")
  end

  def store(script_name, script_object)
    if script_name.present? && script_object.present?
      @scripts[script_name] = script_object
    end
  end

end
