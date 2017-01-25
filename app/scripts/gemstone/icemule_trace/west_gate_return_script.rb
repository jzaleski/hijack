require 'scripts/gemstone/icemule_trace/west_gate_script'

class WestGateReturnScript < WestGateScript
  protected

  def directions
    reverse_directions(super)
  end
end
