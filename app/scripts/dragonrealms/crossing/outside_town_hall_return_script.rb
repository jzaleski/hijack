load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/dragonrealms/crossing/outside_town_hall_script.rb", true

class OutsideTownHallReturnScript < OutsideTownHallScript
  include ReturnMovementScriptMixin
end
