require_reload 'scripts/dragonrealms/crossing/bank_script'

class WeaponsmithScript < BankScript
  protected

  def directions
    [
      NORTHWEST,
      NORTH,
      NORTH,
      NORTH,
      "go weaponsmith|#{OUT}",
    ]
  end

  def location
    "weaponsmith|#{CROSSING}"
  end
end
