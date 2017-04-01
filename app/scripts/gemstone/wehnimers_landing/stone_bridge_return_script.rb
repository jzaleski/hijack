load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/stone_bridge_script.rb", true

class StoneBridgeReturnScript < StoneBridgeScript
  include ReturnMovementScriptMixin
end
