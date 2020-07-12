load "#{MIXINS_DIR}/base/movement_script_mixin.rb", true

module ReturnMovementScriptMixin
  include MovementScriptMixin

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
    OUT => IN,
    IN => OUT,
  }

  def self.included(receiver)
    receiver.class_eval do
      protected

      def directions
        reverse_directions(super)
      end
    end
  end

  protected

  def reverse_direction(direction)
    # short-circuit, returning `nil`, if `direction` responds to `call`
    return nil if direction.respond_to?(:call)
    # `direction` can specify one or more possibilities (delimited by a "|")
    possible_directions = direction.split('|')
    # reverse `possible_directions` and then reverse each `possible_direction`
    # then [re-]join the result with the delimiter
    possible_directions.reverse.map do |possible_direction|
      MOVE_OPPOSITES[possible_direction] || possible_direction
    end.join('|')
  end

  def reverse_directions(directions)
    directions.reverse.map do |direction|
      reverse_direction(direction)
    end.compact
  end
end
