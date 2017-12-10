load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/northern_caravansary/stockade_gate_script.rb", true

class StockadeGateReturnScript < StockadeGateScript
  include ReturnMovementScriptMixin
end
