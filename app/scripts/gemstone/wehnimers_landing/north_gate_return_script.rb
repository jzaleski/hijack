load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/north_gate_script.rb", true

class NorthGateReturnScript < NorthGateScript
  include ReturnMovementScriptMixin
end
