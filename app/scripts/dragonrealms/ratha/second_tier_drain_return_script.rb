require 'scripts/dragonrealms/ratha/second_tier_drain_script'

class SecondTierDrainReturnScript < SecondTierDrainScript
  protected

  def directions
    reverse_directions(super)
  end
end
