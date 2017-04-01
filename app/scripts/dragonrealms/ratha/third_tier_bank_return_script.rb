load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/dragonrealms/ratha/third_tier_bank_script.rb", true

class ThirdTierBankReturnScript < ThirdTierBankScript
  include ReturnMovementScriptMixin
end
