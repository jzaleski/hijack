load "#{MIXINS_DIR}/base/movement_script_mixin.rb", true

module RunnableMovementScriptMixin
  include MovementScriptMixin

  def run
    # set `moving`
    @config[:moving] = true
    # control variable used below to keep track of whether or not we moved
    # during the current iteration, if the value is `falsy` at any point, after
    # attempting to move, the script will short-circuit
    moved = true
    # `move` all of the `directions` until either the script finishes, is killed
    # or exits unexpectedly
    directions.each do |direction_or_method|
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
      break unless moved
    end
    # reset `moving`
    @config.reset(:moving)
    # update `location` if the current value of `moved` is `truthy`
    @config[:location] = location if moved
  end

  protected

  def directions
    []
  end

  def location
    raise \
      %{All #{RunnableMovementScriptMixin}(s) must override the "location" method}
  end
end
