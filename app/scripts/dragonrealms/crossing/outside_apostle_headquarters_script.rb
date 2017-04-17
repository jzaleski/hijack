load "#{SCRIPTS_DIR}/dragonrealms/crossing/outside_weaponsmith_script.rb", true

class OutsideApostleHeadquartersScript < OutsideWeaponsmithScript
  protected

  def directions
    super + [
      NORTH,
      NORTH,
      NORTH,
    ]
  end

  def location
    "outside_apostle_headquarters|#{CROSSING}"
  end
end
