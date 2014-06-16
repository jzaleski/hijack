require 'scripts/dragonrealms/ratha/town_green_script'

class ThirdTierBankScript < TownGreenScript

  protected

  def directions
    super + [
      SOUTH,
      WEST,
      WEST,
      SOUTH,
      SOUTHWEST,
      SOUTH,
      WEST,
      'go gate',
      NORTH,
      NORTH,
      'climb stair',
      'go door',
      EAST,
      EAST,
    ]
  end

  def location
    "third_tier_bank|#{RATHA}"
  end

end
