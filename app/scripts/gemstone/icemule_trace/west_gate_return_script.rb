load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/icemule_trace/west_gate_script.rb", true

class WestGateReturnScript < WestGateScript
  include ReturnMovementScriptMixin
end
