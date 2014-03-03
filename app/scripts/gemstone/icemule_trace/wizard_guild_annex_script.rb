require 'scripts/gemstone/icemule_trace/wizard_guild_script'

class WizardGuildAnnexScript < WizardGuildScript

  protected

  def directions
    super + [
      'go footbridge',
      'go path',
      "go shelter|#{OUT}",
    ]
  end

  def location
    "annex|wizard_guild|#{ICEMULE_TRACE}"
  end

end
