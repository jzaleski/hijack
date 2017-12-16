load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/cave_worms_script.rb", true

class CaveWormsReturnScript < CaveWormsScript
  include ReturnMovementScriptMixin
end
