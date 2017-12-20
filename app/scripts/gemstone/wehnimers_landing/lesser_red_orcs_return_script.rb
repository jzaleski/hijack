load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/lesser_red_orcs_script.rb", true

class LesserRedOrcsReturnScript < LesserRedOrcsScript
  include ReturnMovementScriptMixin
end
