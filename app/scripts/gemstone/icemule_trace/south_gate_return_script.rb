load "#{APP_DIR}/scripts/gemstone/icemule_trace/south_gate_script.rb", true

class SouthGateReturnScript < SouthGateScript
  protected

  def directions
    reverse_directions(super)
  end
end
