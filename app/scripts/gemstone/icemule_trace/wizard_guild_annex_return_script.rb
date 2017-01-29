load "#{SCRIPTS_DIR}/gemstone/icemule_trace/wizard_guild_annex_script.rb", true

class WizardGuildAnnexReturnScript < WizardGuildAnnexScript
  protected

  def directions
    reverse_directions(super)
  end
end
