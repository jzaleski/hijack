load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/dragonrealms/crossing/weaponsmith_script.rb", true

class WeaponsmithReturnScript < WeaponsmithScript
  include ReturnMovementScriptMixin
end
