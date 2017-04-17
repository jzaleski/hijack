load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/dragonrealms/crossing/outside_academy_of_agility_script.rb", true

class OutsideAcademyOfAgilityReturnScript < OutsideAcademyOfAgilityScript
  include ReturnMovementScriptMixin
end
