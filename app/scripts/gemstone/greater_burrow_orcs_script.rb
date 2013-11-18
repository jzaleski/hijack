require 'scripts/base/base_simutronics_movement_script'

class GreaterBurrowOrcsScript < BaseSimutronicsMovementScript

  protected

  def directions
    [
      'go gate',
      SOUTHWEST,
      SOUTH,
      SOUTH,
      SOUTH,
      SOUTH,
      SOUTH,
      SOUTHEAST,
      EAST,
      EAST,
      'go bridge',
      SOUTH,
      SOUTHWEST,
      SOUTHEAST,
      SOUTH,
      WEST,
      WEST,
      SOUTHWEST,
      EAST,
      EAST,
      SOUTH,
      SOUTHWEST,
      SOUTH,
      WEST,
      SOUTH,
      SOUTHWEST,
      NORTH,
      NORTHWEST,
      NORTH,
      NORTHWEST,
      'go crevice',
    ]
  end

end
