require 'scripts/gemstone/wehnimers_landing/stone_bridge_script'

class StoneBridgeReturnScript < StoneBridgeScript
  protected

  def directions
    reverse_directions(super)
  end
end
