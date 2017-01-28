load "#{APP_DIR}/scripts/gemstone/wehnimers_landing/stone_bridge_script.rb", true

class StoneBridgeReturnScript < StoneBridgeScript
  protected

  def directions
    reverse_directions(super)
  end
end
