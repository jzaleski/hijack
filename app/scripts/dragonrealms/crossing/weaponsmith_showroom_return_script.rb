load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/dragonrealms/crossing/weaponsmith_showroom_script.rb", true

class WeaponsmithShowroomReturnScript < WeaponsmithShowroomScript
  include ReturnMovementScriptMixin
end
