require 'scripts/base/base_gemstone_wehnimers_landing_movement_script'

class GemshopScript < BaseGemstoneWehnimersLandingMovementScript

  protected

  def directions
    [
      SOUTHWEST,
      SOUTH,
      SOUTH,
      SOUTH,
      EAST,
      "go shop|#{OUT}",
    ]
  end

  def location
    "gemshop|#{WEHNIMERS_LANDING}"
  end

end
