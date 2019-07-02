require 'bridges/pymud/default_bridge'

class LocalBridge < DefaultBridge
  def initialize(config)
    super
    @config.merge!({:game_host => '127.0.0.1'})
  end
end
