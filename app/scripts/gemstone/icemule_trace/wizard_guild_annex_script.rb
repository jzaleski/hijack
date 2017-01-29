load "#{SCRIPTS_DIR}/gemstone/icemule_trace/wizard_guild_script.rb", true

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
    "wizard_guild_annex|#{ICEMULE_TRACE}"
  end
end
