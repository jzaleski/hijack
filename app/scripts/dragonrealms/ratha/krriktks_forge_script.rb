load "#{SCRIPTS_DIR}/dragonrealms/ratha/second_tier_drain_script.rb", true

class KrriktksForgeScript < SecondTierDrainScript
  protected

  def directions
    super + [
      NORTHEAST,
      EAST,
      SOUTHEAST,
      SOUTHEAST,
      SOUTH,
      SOUTHEAST,
      SOUTHEAST,
      SOUTHEAST,
      "go forge|#{OUT}",
    ]
  end

  def location
    "krriktks_forge|#{RATHA}"
  end
end
