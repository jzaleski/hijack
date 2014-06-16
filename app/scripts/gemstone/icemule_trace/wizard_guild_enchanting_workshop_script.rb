require 'scripts/gemstone/icemule_trace/wizard_guild_script'

class WizardGuildEnchantingWorkshopScript < WizardGuildScript

  protected

  def directions
    super + [
      'go footbridge',
      'go doors',
      WEST,
      NORTHWEST,
    ]
  end

  def location
    "wizard_guild_enchanting_workshop|#{ICEMULE_TRACE}"
  end

end
