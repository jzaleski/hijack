require 'scripts/base/base_simutronics_movement_script'

class CrystalGolemsScript < BaseSimutronicsMovementScript

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
      EAST,
      SOUTHWEST,
      SOUTHEAST,
      SOUTH,
      WEST,
      WEST,
      'go door',
      NORTH,
      NORTH,
      NORTH,
      NORTH,
      NORTH,
      NORTH,
      NORTH,
      NORTH,
      EAST,
      EAST,
      EAST,
      'go step',
      EAST,
      NORTH,
      'go fissure',
    ]
  end

end
