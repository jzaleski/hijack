load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/dragonrealms/crossing/sand_spit_tavern_barroom_script.rb", true

class SandSpitTavernBarroomReturnScript < SandSpitTavernBarroomScript
  include ReturnMovementScriptMixin
end
