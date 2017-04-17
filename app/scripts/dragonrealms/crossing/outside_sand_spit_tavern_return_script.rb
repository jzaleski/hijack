load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/dragonrealms/crossing/outside_sand_spit_tavern_script.rb", true

class OutsideSandSpitTavernReturnScript < OutsideSandSpitTavernScript
  include ReturnMovementScriptMixin
end
