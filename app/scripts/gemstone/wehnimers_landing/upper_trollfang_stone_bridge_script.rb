load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/deep_stream_script.rb", true

class UpperTrollfangStoneBridgeScript < DeepStreamScript
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
    "upper_trollfang_stone_bridge|#{WEHNIMERS_LANDING}"
  end
end
