require_reload 'mixins/base/nexus_movement_script_mixin'
require_reload 'scripts/base/base_simutronics_script'

class BaseSimutronicsMovementScript < BaseSimutronicsScript
  include NexusMovementScriptMixin

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
  WHERE_ARE_YOU_TRYING_TO_GO = 'Where are you trying to go'
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
    WHERE_ARE_YOU_TRYING_TO_GO,
    YOU_CANT_GO_THERE,
  ].join('|')

  MOVE_SUCCESS_PATTERN = [
    OBVIOUS_EXITS,
    OBVIOUS_PATHS,
  ].join('|')

  def run
    directions.each do |direction_or_method|
      moved = false
      # a method can be passed in for cases where something beyond basic
      # movement is required (e.g. guild/society pass{code,word}s)
      if direction_or_method.respond_to?(:call)
        # all methods must return something falsy/truthy so we can determine if
        # the action was successful
        moved = direction_or_method.call
      else
        # if there are multiple options for moving to and from a particular
        # location they are joined with a "|"
        possible_directions = direction_or_method.split('|')
        # try every "possible_direction" exiting the loop as soon as we have
        # successfully moved or have exhausted all options
        possible_directions.each do |possible_direction|
          break if moved = move(possible_direction)
        end
      end
      # exit the script if there were no valid movement directions or the method
      # returned something falsy
      return unless moved
    end
    # update location value (we've made it to our destination)
    @config[:location] = location
  end

  protected

  def move(direction)
    wait_for_match(
      MOVE_PATTERN,
      direction
    ).match(MOVE_SUCCESS_PATTERN)
  end

  def reverse_direction(direction)
    # a direction specify one or more possibilities (delimited by a "|")
    possible_directions = direction.split('|')
    # reverse "possible_directions" and then reverse each "possible_direction"
    # then join the result with the delimiter
    possible_directions.reverse.map do |possible_direction|
      MOVE_OPPOSITES[possible_direction] || possible_direction
    end.join('|')
  end
end
