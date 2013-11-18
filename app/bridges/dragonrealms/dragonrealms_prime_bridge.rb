require 'bridges/base/base_simutronics_bridge'

class DragonrealmsPrimeBridge < BaseSimutronicsBridge

  def initialize(config)
    super
    @config.merge!({
      :game_host => 'dr.simutronics.net',
      :game_port => 4901,
      :game_code => 'DR',
      :script_dir => 'dragonrealms',
    })
  end

end
