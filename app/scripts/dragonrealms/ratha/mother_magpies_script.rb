require 'scripts/dragonrealms/ratha/first_tier_grating_script'

class MotherMagpiesScript < FirstTierGratingScript
  protected

  def directions
    super + [
      EAST,
      NORTHEAST,
      WEST,
      WEST,
      WEST,
      WEST,
      NORTHWEST,
      WEST,
      WEST,
      WEST,
      SOUTHWEST,
      SOUTHEAST,
      SOUTHEAST,
      SOUTH,
      SOUTH,
      SOUTHEAST,
      EAST,
      "go market|#{OUT}",
    ]
  end

  def location
    "mother_magpies|#{RATHA}"
  end
end
