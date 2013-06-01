require 'hijack/bridge/simutronics_bridge'
class GemstonePrimeBridge < SimutronicsBridge
  def initialize(config)
    super
    @config.merge!({
      :game_host => 'gs3.simutronics.net',
      :game_port => 4900,
      :game_code => 'GS3',
    })
  end
end
