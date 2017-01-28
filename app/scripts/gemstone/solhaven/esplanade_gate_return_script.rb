load "#{APP_DIR}/scripts/gemstone/solhaven/esplanade_gate_script.rb", true

class EsplanadeGateReturnScript < EsplanadeGateScript
  protected

  def directions
    reverse_directions(super)
  end
end
