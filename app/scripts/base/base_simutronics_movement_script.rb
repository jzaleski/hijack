require 'scripts/base/base_simutronics_script'

class BaseSimutronicsMovementScript < BaseSimutronicsScript

  def run(args)
    directions.each do |direction|
      break unless move(direction)
    end
  end

  protected

  def directions
    raise %{All #{BaseSimutronicsMovementScript}(s) must override the "directions" method}
  end

end
