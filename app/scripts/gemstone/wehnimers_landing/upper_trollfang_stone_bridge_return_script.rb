load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/upper_trollfang_stone_bridge_script.rb", true

class UpperTrollfangStoneBridgeReturnScript < UpperTrollfangStoneBridgeScript
  include ReturnMovementScriptMixin
end
