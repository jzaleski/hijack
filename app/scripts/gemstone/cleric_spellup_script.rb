load "#{APP_DIR}/scripts/base/base_gemstone_spellup_script.rb", true

class ClericSpellupScript < BaseGemstoneSpellupScript
  protected

  def spells
    [
      [101],
      [103],
      [107],
      [115, true],
      [120, true],
      [202],
      [211, true],
      [215, true],
      [219, true],
      [303, true],
      [307, true],
      [310, true],
      [313, true],
    ]
  end
end
