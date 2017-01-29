load "#{SCRIPTS_DIR}/dragonrealms/ratha/second_tier_drain_script.rb", true

class SecondTierDrainReturnScript < SecondTierDrainScript
  protected

  def directions
    reverse_directions(super)
  end
end
