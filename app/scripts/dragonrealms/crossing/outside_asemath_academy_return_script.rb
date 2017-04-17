load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/dragonrealms/crossing/outside_asemath_academy_script.rb", true

class OutsideAsemathAcademyReturnScript < OutsideAsemathAcademyScript
  include ReturnMovementScriptMixin
end
