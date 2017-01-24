require_reload 'scripts/dragonrealms/ratha/town_green_script'

class ThirdTierGratingScript < TownGreenScript
  protected

  def directions
    super + [
      SOUTH,
      WEST,
      WEST,
      NORTHWEST,
      NORTHEAST,
    ]
  end

  def location
    "third_tier_grating_script|#{RATHA}"
  end
end
