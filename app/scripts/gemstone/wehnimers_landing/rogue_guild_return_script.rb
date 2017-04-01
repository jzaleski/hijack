load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/rogue_guild_script.rb", true

class RogueGuildReturnScript < RogueGuildScript
  include ReturnMovementScriptMixin
end
