load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/dragonrealms/crossing/empaths_guild_courtyard_garden_script.rb", true

class EmpathsGuildCourtyardGardenReturnScript < EmpathsGuildCourtyardGardenScript
  include ReturnMovementScriptMixin
end
