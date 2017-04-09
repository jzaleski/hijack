load "#{SCRIPTS_DIR}/dragonrealms/crossing/outside_weaponsmith_script.rb", true

class OutsideArmoryScript < OutsideWeaponsmithScript
  protected

  def directions
    super + [
      WEST,
    ]
  end

  def location
    "outside_armory|#{CROSSING}"
  end
end
