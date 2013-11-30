require 'scripts/base/base_gemstone_wehnimers_landing_movement_script'

class NorthGateScript < BaseGemstoneWehnimersLandingMovementScript

  protected

  def directions
    [
      NORTHWEST,
      NORTH,
      NORTH,
      EAST,
      NORTH,
    ]
  end

  def location
    "north_gate|#{WEHNIMERS_LANDING}"
  end

end
