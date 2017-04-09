load "#{SCRIPTS_DIR}/dragonrealms/crossing/outside_bank_script.rb", true

class OutsideWeaponsmithScript < OutsideBankScript
  protected

  def directions
    [
      NORTHWEST,
      NORTH,
      NORTH,
      NORTH,
    ]
  end

  def location
    "outside_weaponsmith|#{CROSSING}"
  end
end
