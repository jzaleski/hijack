require 'scripts/gemstone/icemule_trace/wizard_guild_annex_script'

class WizardGuildAnnexReturnScript < WizardGuildAnnexScript

  protected

  def directions
    reverse_directions(super)
  end

end
