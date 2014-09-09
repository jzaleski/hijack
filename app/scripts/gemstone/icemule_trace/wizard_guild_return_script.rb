require 'scripts/gemstone/icemule_trace/wizard_guild_script'

class WizardGuildReturnScript < WizardGuildScript
  protected

  def directions
    reverse_directions(super)
  end
end
