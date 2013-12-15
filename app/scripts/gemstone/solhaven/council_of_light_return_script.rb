require 'scripts/base/base_gemstone_solhaven_movement_script'

class CouncilOfLightReturnScript < BaseGemstoneSolhavenMovementScript

  protected

  def directions
    [
      SOUTH,
      EAST,
      SOUTH,
      EAST,
      OUT,
      'climb wall',
      NORTH,
      NORTH,
      NORTH,
      NORTH,
      NORTH,
      NORTH,
      NORTHWEST,
      NORTHWEST,
    ]
  end

end
