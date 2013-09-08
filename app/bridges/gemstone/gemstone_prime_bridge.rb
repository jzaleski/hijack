require 'bridges/base/base_simutronics_bridge'

class GemstonePrimeBridge < BaseSimutronicsBridge

  def initialize(config)
    super
    @config.merge!({
      :game_host => 'gs3.simutronics.net',
      :game_port => 4900,
      :game_code => 'GS3',
      :script_dir => 'gemstone',
    })
  end

end
