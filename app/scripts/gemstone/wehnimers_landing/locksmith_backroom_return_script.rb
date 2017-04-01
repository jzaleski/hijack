load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/locksmith_backroom_script.rb", true

class LocksmithBackroomReturnScript < LocksmithBackroomScript
  include ReturnMovementScriptMixin
end
