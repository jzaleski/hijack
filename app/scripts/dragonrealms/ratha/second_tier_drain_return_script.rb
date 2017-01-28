load "#{APP_DIR}/scripts/dragonrealms/ratha/second_tier_drain_script.rb", true

class SecondTierDrainReturnScript < SecondTierDrainScript
  protected

  def directions
    reverse_directions(super)
  end
end
