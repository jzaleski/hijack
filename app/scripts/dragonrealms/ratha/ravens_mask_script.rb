load "#{APP_DIR}/scripts/dragonrealms/ratha/second_tier_drain_script.rb", true

class RavensMaskScript < SecondTierDrainScript
  protected

  def directions
    super + [
      NORTHEAST,
      WEST,
      WEST,
      WEST,
      WEST,
      SOUTHWEST,
      WEST,
      "go shop|#{OUT}",
    ]
  end

  def location
    "ravens_mask|#{RATHA}"
  end
end
