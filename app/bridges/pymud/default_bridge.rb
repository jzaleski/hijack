require 'bridges/base/base_bridge'

class DefaultBridge < BaseBridge
  def initialize(config)
    super
    @config.merge!({:game_host => 'pymud.jzaleski.com', :game_port => 7001})
  end

  def connect
    @socket = TCPSocket.new(@config[:game_host], @config[:game_port])
    @socket.sync = true
  end

  protected

  attr_reader :socket
end
