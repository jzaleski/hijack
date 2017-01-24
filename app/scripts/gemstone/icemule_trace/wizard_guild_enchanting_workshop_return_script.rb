require_reload 'scripts/gemstone/icemule_trace/wizard_guild_enchanting_workshop_script'

class WizardGuildEnchantingWorkshopReturnScript < WizardGuildEnchantingWorkshopScript
  protected

  def directions
    reverse_directions(super)
  end
end
