load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/adventurers_guild_office_script.rb", true

class AdventurersGuildOfficeReturnScript < AdventurersGuildOfficeScript
  include ReturnMovementScriptMixin
end
