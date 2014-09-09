module MovementScriptMixin
  def directions
    raise %{All #{MovementScriptMixin}(s) must override the "directions" method}
  end

  def location
    raise %{All #{MovementScriptMixin}(s) must override the "location" method}
  end

  def move(direction)
    raise %{All #{MovementScriptMixin}(s) must override the "move" method}
  end

  def reverse_direction(direction)
    raise \
      %{All #{MovementScriptMixin}(s) must override the "reverse_direction" method}
  end

  def reverse_directions(directions)
    directions.reverse.map do |direction|
      reverse_direction(direction)
    end
  end
end
