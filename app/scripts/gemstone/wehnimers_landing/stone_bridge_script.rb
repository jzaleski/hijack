load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/deep_stream_script.rb", true

class StoneBridgeScript < DeepStreamScript
  protected

  def directions
    super + [
      SOUTHEAST,
      SOUTHEAST,
      NORTHEAST,
      NORTHEAST,
      EAST,
      EAST,
      'go bridge',
    ]
  end

  def location
    "stone_bridge|#{WEHNIMERS_LANDING}"
  end
end
