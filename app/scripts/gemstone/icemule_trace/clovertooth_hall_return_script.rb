require 'scripts/gemstone/icemule_trace/clovertooth_hall_script'

class ClovertoothHallReturnScript < ClovertoothHallScript

  protected

  def directions
    reverse_directions(super)
  end

end
