load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/north_gate_script.rb", true

class NorthGateReturnScript < NorthGateScript
  protected

  def directions
    reverse_directions(super)
  end
end
