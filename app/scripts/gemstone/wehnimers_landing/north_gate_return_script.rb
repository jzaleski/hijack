require 'scripts/gemstone/wehnimers_landing/north_gate_script'

class NorthGateReturnScript < NorthGateScript

  protected

  def directions
    reverse_directions(super)
  end

end
