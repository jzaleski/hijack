require_reload 'scripts/dragonrealms/ratha/first_tier_grating_script'

class CarouselScript < FirstTierGratingScript
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
      "go carousel|#{OUT}",
      "go door|#{OUT}",
    ]
  end

  def location
    "carousel|#{RATHA}"
  end
end
