load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/snowy_plains_stone_bridge_script.rb", true

class MammothRockslideScript < SnowyPlainsStoneBridgeScript
  protected

  def directions
    super + [
      'go bridge',
      NORTHEAST,
      EAST,
      EAST,
      SOUTHEAST,
      SOUTHEAST,
      EAST,
      EAST,
      EAST,
      NORTHEAST,
      NORTHEAST,
      EAST,
      EAST,
      EAST,
      NORTHEAST,
    ]
  end

  def location
    "mammoth_rockslide|#{WEHNIMERS_LANDING}"
  end
end
