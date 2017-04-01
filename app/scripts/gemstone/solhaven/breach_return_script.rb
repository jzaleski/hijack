load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/solhaven/breach_script.rb", true

class BreachReturnScript < BreachScript
  include ReturnMovementScriptMixin
end
