load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/dragonrealms/crossing/outside_traders_guild_script.rb", true

class OutsideTradersGuildReturnScript < OutsideTradersGuildScript
  include ReturnMovementScriptMixin
end
