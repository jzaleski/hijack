require 'bridges/base/base_bridge'

class DefaultBridge < BaseBridge
  def initialize(config)
    super
    @config.merge!({:game_host => 'fed2.ibgames.net', :game_port => 30003})
  end

  def connect
    @socket = TCPSocket.new(@config[:game_host], @config[:game_port])
    @socket.sync = true
    @socket.puts "#{@config[:character_key]}\n\n"
  end

  protected

  attr_reader :socket
end
