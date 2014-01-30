require 'scripts/base/base_gemstone_wehnimers_landing_movement_script'

class RogueGuildScript < BaseGemstoneWehnimersLandingMovementScript

  protected

  def directions
    [
      EAST,
      EAST,
      EAST,
      NORTH,
      EAST,
      EAST,
      SOUTH,
      EAST,
      NORTH,
      EAST,
      EAST,
      SOUTH,
      "go hall|#{OUT}",
      'go door',
      "go panel|#{OUT}",
    ]
  end

  def location
    "rogue_guild|#{WEHNIMERS_LANDING}"
  end

end
