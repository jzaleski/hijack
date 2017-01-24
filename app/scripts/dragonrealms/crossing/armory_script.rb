require_reload 'scripts/dragonrealms/crossing/bank_script'

class ArmoryScript < BankScript
  protected

  def directions
    [
      NORTHWEST,
      NORTH,
      NORTH,
      NORTHWEST,
      "go armory|#{OUT}",
    ]
  end

  def location
    "armory|#{CROSSING}"
  end
end
