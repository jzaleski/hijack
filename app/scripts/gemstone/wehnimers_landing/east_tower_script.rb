require 'scripts/base/base_gemstone_wehnimers_landing_movement_script'

class EastTowerScript < BaseGemstoneWehnimersLandingMovementScript

  protected

  def directions
    [
      NORTHWEST,
      NORTH,
      NORTH,
      EAST,
      NORTH,
      "go east tower|#{OUT}",
    ]
  end

  def location
    "east_tower|#{WEHNIMERS_LANDING}"
  end

end
