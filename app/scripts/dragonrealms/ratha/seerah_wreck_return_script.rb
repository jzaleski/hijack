load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/dragonrealms/ratha/seerah_wreck_script.rb", true

class SeerahWreckReturnScript < SeerahWreckScript
  include ReturnMovementScriptMixin
end
