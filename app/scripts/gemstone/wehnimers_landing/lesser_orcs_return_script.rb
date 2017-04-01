load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/lesser_orcs_script.rb", true

class LesserOrcsReturnScript < LesserOrcsScript
  include ReturnMovementScriptMixin
end
