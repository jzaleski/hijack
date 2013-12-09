require 'scripts/gemstone/wehnimers_landing/rotted_wooden_signpost_script'

class GlacierScript < RottedWoodenSignpostScript

  protected

  def directions
    super + [
      SOUTHWEST,
      SOUTH,
      SOUTHEAST,
      SOUTH,
      SOUTHEAST,
      SOUTH,
      SOUTH,
      SOUTH,
      SOUTHWEST,
      "#{SOUTH}|go path",
      SOUTH,
      SOUTHEAST,
      SOUTHEAST,
      SOUTHEAST,
      SOUTHEAST,
      SOUTHEAST,
      EAST,
      EAST,
      NORTHEAST,
      EAST,
      EAST,
      EAST,
      'go trail',
      NORTH,
      NORTHEAST,
      EAST,
      SOUTHEAST,
      EAST,
      NORTHEAST,
      NORTH,
      NORTHEAST,
      NORTH,
      NORTH,
      NORTH,
      'go trunk',
      NORTHWEST,
      NORTHEAST,
      UP,
      NORTH,
      UP,
      UP,
    ]
  end

  def location
    "glacier|#{WEHNIMERS_LANDING}"
  end

end
