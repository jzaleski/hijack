require 'scripts/base/base_gemstone_wehnimers_landing_movement_script'

class FurrierScript < BaseGemstoneWehnimersLandingMovementScript

  protected

  def directions
    [
      NORTHWEST,
      NORTH,
      NORTH,
      EAST,
      "go furrier|#{OUT}",
    ]
  end

  def location
    "furrier|#{WEHNIMERS_LANDING}"
  end

end
