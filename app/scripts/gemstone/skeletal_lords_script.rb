require 'scripts/base/base_simutronics_movement_script'

class SkeletalLordsScript < BaseSimutronicsMovementScript

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
      SOUTHWEST,
      SOUTH,
      SOUTHEAST,
      SOUTH,
      SOUTHEAST,
      SOUTH,
      SOUTH,
      SOUTH,
      SOUTHWEST,
      "#{SOUTH}|go path",
      SOUTH,
      SOUTHEAST,
      SOUTHEAST,
      SOUTHWEST,
      WEST,
      SOUTH,
      SOUTH,
      SOUTH,
      SOUTH,
      SOUTHEAST,
      SOUTHEAST,
      NORTHEAST,
      NORTHEAST,
      EAST,
      EAST,
      'go bridge',
      SOUTHEAST,
      SOUTH,
      SOUTHEAST,
      SOUTH,
      EAST,
      SOUTH,
      SOUTH,
      SOUTHWEST,
      SOUTH,
      SOUTH,
      SOUTH,
      SOUTH,
      EAST,
      SOUTHWEST,
      SOUTHWEST,
      EAST,
      SOUTHEAST,
      SOUTHWEST,
      WEST,
      SOUTHWEST,
      EAST,
      SOUTHEAST,
      SOUTHEAST,
      SOUTHEAST,
      SOUTHEAST,
      SOUTH,
      'go grass',
      EAST,
      NORTHEAST,
      NORTH,
      'go drawbridge',
      NORTH,
      'go drawbridge',
      NORTH,
      NORTH,
      EAST,
      EAST,
      EAST,
      EAST,
      NORTH,
      NORTH,
      WEST,
      'go ramp',
    ]
  end

end
