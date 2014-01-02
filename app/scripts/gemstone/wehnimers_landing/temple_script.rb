require 'scripts/base/base_gemstone_wehnimers_landing_movement_script'

class TempleScript < BaseGemstoneWehnimersLandingMovementScript

  protected

  def directions
    [
      EAST,
      EAST,
      EAST,
      SOUTH,
      SOUTH,
      EAST,
      "go temple|#{OUT}",
    ]
  end

  def location
    "temple|#{WEHNIMERS_LANDING}"
  end

end
