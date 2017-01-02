require 'bridges/base/base_lich_net_bridge'

class BaseGemstoneBridge < BaseLichNetBridge
  def initialize(config)
    super
    @config.merge!({:lich_net_game => 'GSIV'})
  end
end
