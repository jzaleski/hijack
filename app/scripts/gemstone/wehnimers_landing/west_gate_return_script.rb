load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/west_gate_script.rb", true

class WestGateReturnScript < WestGateScript
  protected

  def directions
    reverse_directions(super)
  end
end
