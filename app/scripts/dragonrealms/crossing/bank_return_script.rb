load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/dragonrealms/crossing/bank_script.rb", true

class BankReturnScript < BankScript
  include ReturnMovementScriptMixin
end
