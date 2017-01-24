require_reload 'scripts/gemstone/icemule_trace/east_gate_script'

class EastGateReturnScript < EastGateScript
  protected

  def directions
    reverse_directions(super)
  end
end
