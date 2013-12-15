require 'scripts/gemstone/solhaven/esplanade_gate_script'

class EsplanadeGateReturnScript < EsplanadeGateScript

  protected

  def directions
    reverse_directions(super)
  end

end
