load "#{APP_DIR}/scripts/gemstone/icemule_trace/wizard_guild_script.rb", true

class WizardGuildReturnScript < WizardGuildScript
  protected

  def directions
    reverse_directions(super)
  end
end
