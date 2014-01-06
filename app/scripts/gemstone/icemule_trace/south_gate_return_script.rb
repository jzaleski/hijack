require 'scripts/gemstone/icemule_trace/south_gate_script'

class SouthGateReturnScript < SouthGateScript

  protected

  def directions
    reverse_directions(super)
  end

end
