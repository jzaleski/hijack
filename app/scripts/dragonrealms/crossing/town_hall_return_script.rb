load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/dragonrealms/crossing/town_hall_script.rb", true

class TownHallReturnScript < TownHallScript
  include ReturnMovementScriptMixin
end
