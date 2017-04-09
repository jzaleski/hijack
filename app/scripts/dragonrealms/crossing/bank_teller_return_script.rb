load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/dragonrealms/crossing/bank_teller_script.rb", true

class BankTellerReturnScript < BankTellerScript
  include ReturnMovementScriptMixin
end
