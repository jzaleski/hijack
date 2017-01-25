require 'scripts/gemstone/wehnimers_landing/rotted_wooden_signpost_script'

class AbandonedInnScript < RottedWoodenSignpostScript
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
      NORTH,
      NORTHEAST,
      NORTH,
      NORTHEAST,
      'go thanot door',
    ]
  end

  def location
    "abandoned_inn|#{WEHNIMERS_LANDING}"
  end
end
