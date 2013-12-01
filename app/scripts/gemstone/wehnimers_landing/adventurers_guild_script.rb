require 'scripts/base/base_gemstone_wehnimers_landing_movement_script'

class AdventurersGuildScript < BaseGemstoneWehnimersLandingMovementScript

  protected

  def directions
    [
      NORTHEAST,
      EAST,
      EAST,
      NORTH,
      NORTH,
      EAST,
      EAST,
      EAST,
      EAST,
      EAST,
      "go building|#{OUT}",
    ]
  end

  def location
    "adventurers_guild|#{WEHNIMERS_LANDING}"
  end

end
