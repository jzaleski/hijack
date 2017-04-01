load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/solhaven/adventurers_guild_script.rb", true

class AdventurersGuildReturnScript < AdventurersGuildScript
  include ReturnMovementScriptMixin
end
