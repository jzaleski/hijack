require 'scripts/base/base_script'

class BaseSimutronicsScript < BaseScript

  DOWN = 'down'
  EAST = 'east'
  NORTH = 'north'
  NORTHEAST = 'northeast'
  NORTHWEST = 'northwest'
  OBVIOUS_EXITS = 'Obvious exits:'
  OBVIOUS_PATHS = 'Obvious paths:'
  OUT = 'out'
  SORRY_YOU_MAY_ONLY_TYPE_AHEAD = 'Sorry, you may only type ahead'
  SOUTH = 'south'
  SOUTHEAST = 'southeast'
  SOUTHWEST = 'southwest'
  UP = 'up'
  WAIT = '\.\.\.wait'
  WEST = 'west'
  YOU_CANT_GO_THERE = "You can't go there"

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

  MOVE_PATTERN = [
    OBVIOUS_EXITS,
    OBVIOUS_PATHS,
    YOU_CANT_GO_THERE,
  ].join('|')

  MOVE_SUCCESS_PATTERN = [
    OBVIOUS_PATHS,
    OBVIOUS_EXITS,
  ].join('|')

  RETRY_PATTERN = [
    SORRY_YOU_MAY_ONLY_TYPE_AHEAD,
    WAIT,
  ].join('|')

  protected

  def move(direction)
    wait_for_match(
      MOVE_PATTERN,
      direction
    ).match(MOVE_SUCCESS_PATTERN)
  end

  def reverse_direction(direction)
    MOVE_OPPOSITES[direction] || direction
  end

  def reverse_directions(directions)
    directions.reverse.map do |direction|
      reverse_direction(direction)
    end
  end

  def wait_for_match(pattern, command=nil)
    # handle retries because of roundtime or type-aheads here, most times, this
    # loop will exit in one or few iterations
    loop do
      result = super(
        "#{pattern}|#{RETRY_PATTERN}",
        command
      )
      # success
      return result if result.match(pattern)
      # sleep before retrying
      sleep 1
    end
  end

end
