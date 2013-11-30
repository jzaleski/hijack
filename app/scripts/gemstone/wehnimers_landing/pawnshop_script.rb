require 'scripts/base/base_gemstone_wehnimers_landing_movement_script'

class PawnshopScript < BaseGemstoneWehnimersLandingMovementScript

  protected

  def directions
    [
      NORTHEAST,
      EAST,
      EAST,
      EAST,
      EAST,
      EAST,
      SOUTH,
      EAST,
      NORTH,
      "go pawnshop|#{OUT}",
    ]
  end

  def location
    "pawnshop|#{WEHNIMERS_LANDING}"
  end

end
