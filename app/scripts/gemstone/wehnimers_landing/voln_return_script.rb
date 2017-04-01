load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/voln_script.rb", true

class VolnReturnScript < VolnScript
  include ReturnMovementScriptMixin
end
