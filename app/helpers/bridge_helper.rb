class BridgeHelper
  def available_bridges(game)
    Dir.entries("#{BRIDGES_DIR}/#{game}").
      reject { |entry| BRIDGES_TO_IGNORE.include?(entry) }.
      map { |entry| entry.gsub(/_bridge\.rb\Z/, '') }
  end

  def construct_bridge(config)
    # extract and validate all of the necessary arguments
    game_name = ensure_game_name(config)
    bridge_name = ensure_bridge_name(config)
    bridge_class_name = construct_bridge_class_name(bridge_name)
    bridge_file_path = ensure_bridge_file_path(game_name, bridge_name)
    # load the bridge-file and validate the arguments
    load bridge_file_path
    bridge_class = Object::const_get(bridge_class_name)
    ensure_required_args!(config, bridge_class)
    # construct and return a bridge instance
    bridge_class.new(config)
  end

  private

  BRIDGES_TO_IGNORE = %w[
    .
    ..
    base
  ]

  def construct_bridge_class_name(bridge_name)
    "#{bridge_name.split('_').map(&:capitalize).join}Bridge"
  end

  def ensure_bridge_file_path(game_name, bridge_name)
    bridge_file_path = "#{BRIDGES_DIR}/#{game_name}/#{bridge_name}_bridge.rb"
    raise %{Bridge: "#{bridge_name}" for game: "#{game_name}" does not exist..} \
      unless bridge_file_path && File.exists?(bridge_file_path)
    bridge_file_path
  end

  def ensure_bridge_name(config)
    bridge_name = config[:bridge]
    raise 'You must specify a "bridge"' unless bridge_name
    bridge_name
  end

  def ensure_game_name(config)
    game_name = config[:game]
    raise 'You must specify a "game"' unless game_name
    game_name
  end

  def ensure_required_args!(config, bridge_class)
    raise %{Bridge: "#{bridge_class.name}" is missing one or more required arguments} \
      unless bridge_class.required_args.all? { |key| config[key] }
  end
end
