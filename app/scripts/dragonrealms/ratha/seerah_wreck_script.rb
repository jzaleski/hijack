require_reload 'scripts/dragonrealms/ratha/first_tier_grating_script'

class SeerahWreckScript < FirstTierGratingScript
  protected

  def directions
    super + [
      EAST,
      NORTHEAST,
      SOUTHEAST,
      SOUTH,
      SOUTHEAST,
      SOUTHEAST,
      SOUTH,
      SOUTH,
      SOUTH,
      WEST,
      NORTHWEST,
      WEST,
      SOUTHWEST,
      WEST,
      WEST,
      WEST,
      SOUTHWEST,
      WEST,
      SOUTHWEST,
      WEST,
      WEST,
      SOUTHWEST,
      SOUTHWEST,
      WEST,
      SOUTHWEST,
      SOUTHWEST,
    ]
  end

  def location
    "seerah_wreck|#{RATHA}"
  end
end
