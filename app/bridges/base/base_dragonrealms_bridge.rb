require 'bridges/base/base_lich_net_bridge'

class BaseDragonrealmsBridge < BaseLichNetBridge
  def initialize(config)
    super
    @config.merge!({:lich_net_game => 'DR'})
  end
end
