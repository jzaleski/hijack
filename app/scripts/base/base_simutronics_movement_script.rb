require 'scripts/base/base_simutronics_script'

class BaseSimutronicsMovementScript < BaseSimutronicsScript

  def run(args)
    directions.each do |direction|
      moved = false
      # if there are multiple options for moving to and from a particular room
      # they are joined with a "|"
      possible_directions = direction.split('|')
      # try every "possible_direction" exit the loop as soon as we successfully
      # move or have exhausted all options
      possible_directions.each do |possible_direction|
        break if moved = move(possible_direction)
      end
      # exit the script if there were no valid movement directions
      return unless moved
    end
  end

  protected

  def directions
    raise %{All #{BaseSimutronicsMovementScript}(s) must override the "directions" method}
  end

end
