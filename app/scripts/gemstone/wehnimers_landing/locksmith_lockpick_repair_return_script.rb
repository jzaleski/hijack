load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/locksmith_lockpick_repair_script.rb", true

class LocksmithLockpickRepairReturnScript < LocksmithLockpickRepairScript
  include ReturnMovementScriptMixin
end
