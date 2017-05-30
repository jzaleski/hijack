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

  def gets
    # perform all operations on a copy of the original string
    str = super.dup.rstrip
    # apply output formatting (assumes all values are complete messages)
    str.present? ? "#{str}\n\n" : ''
  end

  protected

  attr_reader :socket
end
