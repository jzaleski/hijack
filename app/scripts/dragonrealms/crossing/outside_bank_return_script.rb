load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/dragonrealms/crossing/outside_bank_script.rb", true

class OutsideBankReturnScript < OutsideBankScript
  include ReturnMovementScriptMixin
end
