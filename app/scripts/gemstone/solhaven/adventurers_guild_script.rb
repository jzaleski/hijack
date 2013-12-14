require 'scripts/base/base_gemstone_solhaven_movement_script'

class AdventurersGuildScript < BaseGemstoneSolhavenMovementScript

  protected

  def directions
    [
      NORTHEAST,
      EAST,
      EAST,
      NORTH,
      "go building|#{OUT}",
    ]
  end

  def location
    "adventurers_guild|#{SOLHAVEN}"
  end

end
