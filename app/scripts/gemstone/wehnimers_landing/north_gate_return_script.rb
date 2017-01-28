load "#{APP_DIR}/scripts/gemstone/wehnimers_landing/north_gate_script.rb", true

class NorthGateReturnScript < NorthGateScript
  protected

  def directions
    reverse_directions(super)
  end
end
