load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/icemule_trace/adventurers_guild_script.rb", true

class AdventurersGuildReturnScript < AdventurersGuildScript
  include ReturnMovementScriptMixin
end
