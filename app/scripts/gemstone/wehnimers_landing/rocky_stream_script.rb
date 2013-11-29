require 'scripts/gemstone/wehnimers_landing/rotted_wooden_signpost_script'

class RockyStreamScript < RottedWoodenSignpostScript

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
      SOUTHWEST,
      WEST,
      SOUTH,
      SOUTH,
      SOUTH,
      SOUTH,
      SOUTHEAST,
      SOUTHEAST,
      NORTHEAST,
      NORTHEAST,
      EAST,
      EAST,
      'go bridge',
      SOUTHEAST,
      SOUTH,
      SOUTHEAST,
      SOUTH,
      EAST,
      SOUTH,
      SOUTH,
      SOUTHWEST,
      SOUTH,
      SOUTH,
      SOUTH,
      SOUTH,
      EAST,
      SOUTHWEST,
      SOUTHWEST,
      EAST,
      SOUTHEAST,
      SOUTHWEST,
      WEST,
      SOUTHWEST,
      EAST,
      SOUTHEAST,
      SOUTHEAST,
      SOUTHEAST,
      SOUTHEAST,
      SOUTH,
    ]
  end

end
