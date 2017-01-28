load "#{APP_DIR}/scripts/base/base_gemstone_spellup_script.rb", true

class RangerSpellupScript < BaseGemstoneSpellupScript
  protected

  def spells
    [
      [101],
      [103],
      [107],
      [115, true],
      [120, true],
      [601, true],
      [602, true],
      [606, true],
      [611],
      [613, true],
      [617, true],
      [618],
      [640, true],
    ]
  end
end
