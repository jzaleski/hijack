require 'scripts/gemstone/wehnimers_landing/stone_bridge_script'

class MammothRockslideScript < StoneBridgeScript
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
