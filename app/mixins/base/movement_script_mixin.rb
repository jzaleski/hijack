module MovementScriptMixin
  DOWN = 'down'
  EAST = 'east'
  NORTH = 'north'
  NORTHEAST = 'northeast'
  NORTHWEST = 'northwest'
  OUT = 'out'
  SOUTH = 'south'
  SOUTHEAST = 'southeast'
  SOUTHWEST = 'southwest'
  UP = 'up'
  WEST = 'west'

  MOVE_OPPOSITES = {
    DOWN => UP,
    EAST => WEST,
    NORTH => SOUTH,
    NORTHEAST => SOUTHWEST,
    NORTHWEST => SOUTHEAST,
    SOUTH => NORTH,
    SOUTHEAST => NORTHWEST,
    SOUTHWEST => NORTHEAST,
    UP => DOWN,
    WEST => EAST,
  }

  protected

  def reverse_direction(direction)
    # a direction specify one or more possibilities (delimited by a "|")
    possible_directions = direction.split('|')
    # reverse "possible_directions" and then reverse each "possible_direction"
    # then join the result with the delimiter
    possible_directions.reverse.map do |possible_direction|
      MOVE_OPPOSITES[possible_direction] || possible_direction
    end.join('|')
  end

  def reverse_directions(directions)
    directions.reverse.map do |direction|
      reverse_direction(direction)
    end
  end
end
