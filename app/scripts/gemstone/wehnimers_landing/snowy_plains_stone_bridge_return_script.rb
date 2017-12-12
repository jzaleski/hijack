load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/snowy_plains_stone_bridge_script.rb", true

class SnowyPlainsStoneBridgeReturnScript < SnowyPlainsStoneBridgeScript
  include ReturnMovementScriptMixin
end
