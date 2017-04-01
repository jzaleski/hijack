load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/greater_burrow_orcs_script.rb", true

class GreaterBurrowOrcsReturnScript < GreaterBurrowOrcsScript
  include ReturnMovementScriptMixin
end
