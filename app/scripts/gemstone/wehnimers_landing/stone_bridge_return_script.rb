load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/stone_bridge_script.rb", true

class StoneBridgeReturnScript < StoneBridgeScript
  protected

  def directions
    reverse_directions(super)
  end
end
