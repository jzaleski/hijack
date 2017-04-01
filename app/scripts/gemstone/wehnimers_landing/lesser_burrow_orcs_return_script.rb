load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/lesser_burrow_orcs_script.rb", true

class LesserBurrowOrcsReturnScript < LesserBurrowOrcsScript
  include ReturnMovementScriptMixin
end
