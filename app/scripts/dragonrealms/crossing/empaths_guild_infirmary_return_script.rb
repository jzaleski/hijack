load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/dragonrealms/crossing/empaths_guild_infirmary_script.rb", true

class EmpathsGuildInfirmaryReturnScript < EmpathsGuildInfirmaryScript
  include ReturnMovementScriptMixin
end
