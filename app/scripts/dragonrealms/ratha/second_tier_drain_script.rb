load "#{SCRIPTS_DIR}/dragonrealms/ratha/third_tier_grating_script.rb", true

class SecondTierDrainScript < ThirdTierGratingScript
  protected

  def directions
    super + [
      'go grating',
      'go crevice',
      EAST,
      SOUTHEAST,
      DOWN,
      SOUTH,
      'go open',
      'go drain',
    ]
  end

  def location
    "second_tier_drain_script|#{RATHA}"
  end
end
