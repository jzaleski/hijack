require 'scripts/gemstone/wehnimers_landing/west_gate_script'

class WestGateReturnScript < WestGateScript
  protected

  def directions
    reverse_directions(super)
  end
end
