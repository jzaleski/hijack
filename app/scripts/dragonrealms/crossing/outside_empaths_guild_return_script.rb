load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/dragonrealms/crossing/outside_empaths_guild_script.rb", true

class OutsideEmpathsGuildReturnScript < OutsideEmpathsGuildScript
  include ReturnMovementScriptMixin
end
