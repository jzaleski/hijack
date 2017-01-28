load "#{APP_DIR}/scripts/gemstone/icemule_trace/east_gate_script.rb", true

class EastGateReturnScript < EastGateScript
  protected

  def directions
    reverse_directions(super)
  end
end
