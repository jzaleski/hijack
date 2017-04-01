load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/dragonrealms/ratha/first_tier_grating_script.rb", true

class FirstTierGratingReturnScript < FirstTierGratingScript
  include ReturnMovementScriptMixin
end
