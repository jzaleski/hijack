load "#{APP_DIR}/scripts/gemstone/icemule_trace/clovertooth_hall_script.rb", true

class ClovertoothHallReturnScript < ClovertoothHallScript
  protected

  def directions
    reverse_directions(super)
  end
end
