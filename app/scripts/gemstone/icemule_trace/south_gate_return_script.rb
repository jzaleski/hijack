load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/icemule_trace/south_gate_script.rb", true

class SouthGateReturnScript < SouthGateScript
  include ReturnMovementScriptMixin
end
