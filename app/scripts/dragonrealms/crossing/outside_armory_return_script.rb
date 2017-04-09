load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/dragonrealms/crossing/outside_armory_script.rb", true

class OutsideArmoryReturnScript < OutsideArmoryScript
  include ReturnMovementScriptMixin
end
