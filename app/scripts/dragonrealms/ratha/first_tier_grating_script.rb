load "#{SCRIPTS_DIR}/dragonrealms/ratha/second_tier_drain_script.rb", true

class FirstTierGratingScript < SecondTierDrainScript
  protected

  def directions
    super + [
      'go drain',
      'go open',
      DOWN,
      NORTHEAST,
      SOUTHEAST,
      EAST,
      'go pass',
      'go grating',
    ]
  end

  def location
    "first_tier_grating|#{RATHA}"
  end
end
