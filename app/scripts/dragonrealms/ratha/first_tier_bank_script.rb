load "#{APP_DIR}/scripts/dragonrealms/ratha/first_tier_grating_script.rb", true

class FirstTierBankScript < FirstTierGratingScript
  protected

  def directions
    super + [
      EAST,
      NORTHEAST,
      SOUTHEAST,
      SOUTH,
      SOUTHEAST,
      SOUTHEAST,
      NORTHEAST,
      'climb stairs',
      'go doors',
    ]
  end

  def location
    "first_tier_bank|#{RATHA}"
  end
end
