load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/locksmith_script.rb", true

class LocksmithReturnScript < LocksmithScript
  include ReturnMovementScriptMixin
end
