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
      elsif top_level_script_name = command_parts[0]
        # instantiate an "Array" (used like a "Stack") to store the script-names
        # and script-objects in their desired execution order
        script_names_and_objects = []
        # [try to] construct the top-level script-object. First, extract the
        # script-args (stripping out the "script_name" and any leading/trailing
        # whitespace before attempting to parse the string)
        top_level_script_object = construct_script_object(
          top_level_script_name,
          @arguments_helper.parse(command.sub(top_level_script_name, '').strip)
        )
        # short circuit if the top-level script-object was not successfully
        # constructed
        return unless top_level_script_object.present?
        # push the top-level script-name and script-object onto the stack
        script_names_and_objects.push([
          top_level_script_name,
          top_level_script_object,
        ])
        # determine if it is necessary to return to the nexus before executing
        # the top-level script-object
        if \
          should_return_to_nexus?(top_level_script_object) &&
          return_script_name = return_script_name(@config[:location])
          # [try to] construct the return script-object. For the time being the
          # script-args are only passed to the top-level script-object (there is
          # no specific reason for this)
          return_script_object = construct_script_object(return_script_name)
          # short circuit if the return script-object was not successfully
          # constructed
          return unless return_script_object.present?
          # push the return script-object onto the stack
          script_names_and_objects.push([
            return_script_name,
            return_script_object,
          ])
        end
        # don't block the main-thread waiting for scripts to finish execution
        Thread.new do
          # when the stack is empty, we're done
          until script_names_and_objects.empty?
            # unpack the script-name and script-object
            script_name, script_object = script_names_and_objects.pop
            # memoize the script-object so that it can be managed externally
            store(script_name, script_object)
            # update the "last_script" information
            @last_script = script_name
            script_object.class.ancestors[1..-1].each do |ancestor|
              @last_scripts_by_type_name[ancestor.name] = script_name
            end
            # start execution then block until the script exits or is killed
            script_object.start_run
            # if the "script" was killed, we are done
            return if script_object.killed?
          end
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

  def construct_script_object(script_name, args=nil)
    # short-circuit if the script-name is invalid
    if script_name.blank?
      @output_buffer.puts "\nInvalid script-name specified.."
      return
    end
    # short-circuit if the script is already running
    if running?(script_name)
      @output_buffer.puts "\nScript: '#{script_name}' is already running.."
      return
    end
    # short-circuit if a script-path could not be determined
    if (script_path = script_path(script_name)).nil?
      @output_buffer.puts "\nScript: '#{script_name}' does not exist.."
      return
    end
    # short-circuit if the script-file could not be loaded
    if !load_script(script_path)
      @output_buffer.puts "\nScript: '#{script_name}' could to be loaded.."
      return
    end
    # short-circuit if the script-class could not be loaded
    if (script_class = Object::const_get(script_class_name(script_name))).nil?
      @output_buffer.puts "\nScript: '#{script_name}' class could to be loaded.."
      return
    end
    # construct the script-object
    script_object = script_class.new(
      @config,
      @bridge,
      @callback_helper,
      @logging_helper,
      :args => args || [],
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
    # short-circuit if the args to the script-object were invalid
    if !script_object.validate_args
      @output_buffer.puts \
        "\nScript: '#{script_name}' was invoked with invalid arguments.."
      return
    end
    # return the script-object
    script_object
  end

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

  def load_script(script_path)
    begin
      load_reload script_path
      true
    rescue Exception => e
      @logging_helper.log_exception_with_backtrace(e)
      false
    end
  end

  def list_available
    scripts = script_directories.map do |script_directory|
      Dir["#{script_directory}/*_script.rb"].map do |script_path|
        "- #{/\A.+\/([\w]+)_script\.rb\Z/.match(script_path).captures.first}"
      end
    end.flatten.sort.uniq
    @output_buffer.puts "\nAvailable scripts:\n==================\n\n"
    if scripts.empty?
      @output_buffer.puts '(none)'
    else
      scripts.each { |script| @output_buffer.puts(script) }
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
      scripts.each { |script| @output_buffer.puts(script) }
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

  def resume(script_name)
    script_object = @scripts[script_name]
    if script_object.nil?
      @output_buffer.puts "\nScript: '#{script_name}' is not running.."
      return
    end
    if !script_object.paused?
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

  def return_script_name(location)
    "#{location.split('|').first}_return" if location.present?
  end

  def running?(script_name)
    script_object = @scripts[script_name]
    script_object && script_object.running?
  end

  def script_directories
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
      # lastly, include the shared directory
      script_directories << "#{SCRIPTS_DIR}/share"
    end
  end

  def script_class_name(script_name)
    "#{script_name.split('_').map(&:capitalize).join}Script"
  end

  def script_path(script_name)
    script_directories.map do |script_directory|
      script_path = File.join(script_directory, "#{script_name}_script.rb")
      File.exist?(script_path) ? script_path : nil
    end.compact.first
  end

  def should_return_to_nexus?(script_object)
    # it can be inferred that scripts that respond-to the "nexus_location"
    # method are nexus[ed] travel-scripts. Under the conditions below it is
    # necessary to travel back to the nexus before branching out to the desired
    # location
    script_object.present? &&
      script_object.respond_to?(:nexus_location) &&
      !script_object.class.name.end_with?('ReturnScript') &&
      @config[:location].present? &&
      script_object.nexus_location != @config[:location] &&
      last_script !~ /_return\Z/
  end

  def store(script_name, script_object)
    if script_name.present? && script_object.present?
      @scripts[script_name] = script_object
    end
  end
end
