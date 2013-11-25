require 'scripts/base/base_simutronics_movement_script'

class ManticoresScript < BaseSimutronicsMovementScript

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
      'go bank',
      NORTHEAST,
      NORTHEAST,
      NORTH,
      WEST,
      NORTHEAST,
      NORTH,
      NORTHEAST,
      NORTHEAST,
      NORTH,
      NORTH,
      NORTHEAST,
      NORTH,
      'go rockslide',
    ]
  end

end
