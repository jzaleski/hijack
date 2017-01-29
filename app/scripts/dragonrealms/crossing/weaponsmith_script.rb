load "#{SCRIPTS_DIR}/dragonrealms/crossing/bank_script.rb", true

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
