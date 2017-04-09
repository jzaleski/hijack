load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/dragonrealms/crossing/outside_weaponsmith_script.rb", true

class OutsideWeaponsmithReturnScript < OutsideWeaponsmithScript
  include ReturnMovementScriptMixin
end
