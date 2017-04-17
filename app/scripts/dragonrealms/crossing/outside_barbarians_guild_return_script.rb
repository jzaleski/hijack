load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/dragonrealms/crossing/outside_barbarians_guild_script.rb", true

class OutsideBarbariansGuildReturnScript < OutsideBarbariansGuildScript
  include ReturnMovementScriptMixin
end
