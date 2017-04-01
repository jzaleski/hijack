load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/icemule_trace/wizard_guild_enchanting_workshop_script.rb", true

class WizardGuildEnchantingWorkshopReturnScript < WizardGuildEnchantingWorkshopScript
  include ReturnMovementScriptMixin
end
