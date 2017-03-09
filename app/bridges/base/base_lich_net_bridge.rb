require 'bridges/base/base_simutronics_bridge'

class BaseLichNetBridge < BaseSimutronicsBridge
  def initialize(config)
    super
    @config.merge!({:lich_net_name => config[:character]})
  end

  def disconnect(str=nil)
    super
    if lich_net_connected?
      @lich_net_helper.disconnect
    end
  end

  def start_buffering
    super
    if enable_lich_net?
      initialize_lich_net_buffers
      initialize_lich_net_helper
      start_lich_net
    end
  end

  protected

  def handle_command(str)
    if lich_net_connected? && str.start_with?('@')
      @lich_net_input_buffer.puts(str[1..-1])
    else
      super
    end
  end

  private

  def enable_lich_net?
    @config.enable_lich_net?
  end

  def initialize_lich_net_buffers
    initialize_lich_net_input_buffer
    initialize_lich_net_output_buffer
  end

  def initialize_lich_net_input_buffer
    @lich_net_input_buffer ||= Buffer.new
  end

  def initialize_lich_net_helper
    @lich_net_helper ||= LichNetHelper.new(
      :game => @config[:lich_net_game],
      :name => @config[:lich_net_name],
      :channel => @config[:lich_net_channel],
      :stdin => @lich_net_input_buffer,
      :stdout => @lich_net_output_buffer,
      :output_format => "\n%s",
      :logging_helper => @logging_helper
    )
  end

  def initialize_lich_net_output_buffer
    @lich_net_output_buffer ||= @output_buffer
  end

  def lich_net_connected?
    !@lich_net_helper.nil? &&
      @lich_net_helper.connected?
  end

  def start_lich_net
    @lich_net_helper.connect
  rescue Exception => e
    @logging_helper.log_exception_with_backtrace(e)
  end
end
