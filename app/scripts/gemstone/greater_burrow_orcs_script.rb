require 'scripts/base/base_gemstone_script'

class GreaterBurrowOrcsScript < BaseGemstoneScript

  DIRECTIONS = [
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

  def run(args)
    reverse = [RETURN, REVERSE].include?(args[0])
    directions = reverse ? DIRECTIONS.reverse : DIRECTIONS
    directions.each do |direction|
      move(direction, reverse)
    end
  end

end
