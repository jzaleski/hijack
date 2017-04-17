load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/dragonrealms/crossing/thieves_guild_office_script.rb", true

class ThievesGuildOfficeReturnScript < ThievesGuildOfficeScript
  include ReturnMovementScriptMixin
end
