load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/dragonrealms/crossing/strength_script.rb", true

class StrengthReturnScript < StrengthScript
  include ReturnMovementScriptMixin
end
