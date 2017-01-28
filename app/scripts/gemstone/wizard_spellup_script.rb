load "#{APP_DIR}/scripts/base/base_gemstone_spellup_script.rb", true

class WizardSpellupScript < BaseGemstoneSpellupScript
  protected

  def spells
    [
      [401],
      [406],
      [414],
      [425, true],
      [430, true],
      [503],
      [507, true],
      [508, true],
      [509],
      [513, true],
      [520, true],
      [540, true],
      [905, true],
      [911],
      [913, true],
    ]
  end
end
