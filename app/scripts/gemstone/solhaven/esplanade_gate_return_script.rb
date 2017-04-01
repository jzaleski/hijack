load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/solhaven/esplanade_gate_script.rb", true

class EsplanadeGateReturnScript < EsplanadeGateScript
  include ReturnMovementScriptMixin
end
