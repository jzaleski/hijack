load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/thyrils_script.rb", true

class ThyrilsReturnScript < ThyrilsScript
  include ReturnMovementScriptMixin
end
