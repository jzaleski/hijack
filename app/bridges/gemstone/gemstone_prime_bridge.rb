require 'bridges/base/base_gemstone_bridge'

class GemstonePrimeBridge < BaseGemstoneBridge
  def initialize(config)
    super
    @config.merge!({
      :game_host => 'gs3.simutronics.net',
      :game_port => 4900,
      :game_code => 'GS3',
      :lich_net_channel => 'LNet',
    })
  end
end
