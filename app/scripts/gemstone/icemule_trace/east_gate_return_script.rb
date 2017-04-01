load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/icemule_trace/east_gate_script.rb", true

class EastGateReturnScript < EastGateScript
  include ReturnMovementScriptMixin
end
