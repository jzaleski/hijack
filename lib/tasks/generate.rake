namespace :generate do
  desc 'Generate a return-script for the specified `game_name`, `script_name` and `town_name`'
  task :return_script, %i[game_name script_name town_name] do |t, args|
    game_name = args[:game_name]
    script_name = args[:script_name]
    town_name = args[:town_name]
    abort 'You must provide values for `game_name`, `script_name` and `town_name`' \
      unless game_name && script_name && town_name
    return_script_path = return_script_path(
      game_name,
      script_name,
      town_name
    )
    return_script = generate_return_script(
      game_name,
      script_name,
      town_name
    )
    File.write(return_script_path, return_script)
    puts "Generated return-script: #{return_script_path}"
  end

  desc 'Generate a spec-stub for the specified `game_name`, `script_name` and optional `town_name`'
  task :script_spec, %i[game_name script_name town_name] do |t, args|
    game_name = args[:game_name]
    script_name = args[:script_name]
    town_name = args[:town_name]
    abort 'You must provide both a `game_name` and `script_name` value' \
      unless game_name && script_name
    spec_path = spec_path(
      game_name,
      script_name,
      town_name
    )
    spec = generate_spec(
      game_name,
      script_name,
      town_name
    )
    File.write(spec_path, spec)
    puts "Generated script-spec: #{spec_path}"
  end

  private

  def generate_return_script(game_name, script_name, town_name)
    return_script_class_name = return_script_class_name(script_name)
    script_class_name = script_class_name(script_name)
    ERB.new(return_script_template).result(binding)
  end

  def generate_spec(game_name, script_name, town_name)
    script_path_no_extension = script_path_no_extension(
      game_name,
      script_name,
      town_name
    )
    script_class_name = script_class_name(script_name)
    ERB.new(script_spec_template).result(binding)
  end

  def return_script_class_name(script_name)
    "#{script_name.to_camel_case}ReturnScript"
  end

  def return_script_path(game_name, script_name, town_name)
    "#{APP_DIR}/#{return_script_path_no_extension(game_name, script_name, town_name)}.rb"
  end

  def return_script_path_no_extension(game_name, script_name, town_name)
    "#{script_directory(game_name, town_name)}/#{script_name}_return_script"
  end

  def return_script_template
    File.read(return_script_template_path)
  end

  def return_script_template_path
    "#{TEMPLATES_DIR}/return_script.rb.erb"
  end

  def script_class_name(script_name)
    "#{script_name.to_camel_case}Script"
  end

  def script_directory(game_name, town_name)
    "scripts/#{game_name}#{'/' + town_name if town_name}"
  end

  def script_path(game_name, script_name, town_name)
    "#{script_path_no_extension(game_name, script_name, town_name)}.rb"
  end

  def script_path_no_extension(game_name, script_name, town_name)
    "#{script_directory(game_name, town_name)}/#{script_name}_script"
  end

  def script_spec_template
    File.read(script_spec_template_path)
  end

  def script_spec_template_path
    "#{TEMPLATES_DIR}/script_spec.rb.erb"
  end

  def spec_directory(game_name, town_name)
    "#{SPEC_DIR}/scripts/#{game_name}#{'/' + town_name if town_name}"
  end

  def spec_path(game_name, script_name, town_name)
    "#{spec_path_no_extension(game_name, script_name, town_name)}.rb"
  end

  def spec_path_no_extension(game_name, script_name, town_name)
    "#{spec_directory(game_name, town_name)}/#{script_name}_script_spec"
  end
end
