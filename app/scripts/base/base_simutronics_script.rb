require 'scripts/base/base_script'

class BaseSimutronicsScript < BaseScript

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

  OBVIOUS_EXITS = 'Obvious exits:'
  OBVIOUS_PATHS = 'Obvious paths:'
  RETURN = 'return'
  REVERSE = 'reverse'
  SORRY_YOU_MAY_ONLY_TYPE_AHEAD = 'Sorry, you may only type ahead'
  WAIT = '\.\.\.wait'

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
  ].join('|')

  RETRY_PATTERN = [
    SORRY_YOU_MAY_ONLY_TYPE_AHEAD,
    WAIT,
  ].join('|')

  def move(direction, reverse=false)
    wait_for_match(
      MOVE_PATTERN,
      reverse ? (MOVE_OPPOSITES[direction] || direction) : direction
    )
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
