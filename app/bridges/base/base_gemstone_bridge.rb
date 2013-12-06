require 'bridges/base/base_simutronics_bridge'

class BaseGemstoneBridge < BaseSimutronicsBridge

  def start_buffering
    super
    if lichnet_enabled?
      initialize_lichnet_input_buffer
      initialize_lichnet_output_buffer
      initialize_lichnet_helper
      start_lichnet
    end
  end

  protected

  def handle_command(str)
    if lichnet_connected? && str.start_with?('@')
      @lichnet_input_buffer.puts(str[1..-1])
    else
      super
    end
  end

  private

  def initialize_lichnet_input_buffer
    @lichnet_input_buffer ||= Buffer.new
  end

  def initialize_lichnet_helper
    @lichnet_helper ||= LichNetHelper.new(
      :game => @config[:lnet_game],
      :name => @config[:lnet_name],
      :stdin => @lichnet_input_buffer,
      :stdout => @lichnet_output_buffer,
      :output_format => "\n%s"
    )
  end

  def initialize_lichnet_output_buffer
    @lichnet_output_buffer ||= @output_buffer
  end

  def lichnet_connected?
    @lichnet_helper &&
      @lichnet_helper.connected?
  end

  def lichnet_enabled?
    @config[:lnet_enable].to_s == 'true'
  end

  def start_lichnet
    @lichnet_helper.run
  end

end
