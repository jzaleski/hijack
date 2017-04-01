load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/dragonrealms/ratha/second_tier_drain_script.rb", true

class SecondTierDrainReturnScript < SecondTierDrainScript
  include ReturnMovementScriptMixin
end
