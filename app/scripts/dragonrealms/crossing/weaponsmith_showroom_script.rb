load "#{SCRIPTS_DIR}/dragonrealms/crossing/outside_weaponsmith_script.rb", true

class WeaponsmithShowroomScript < OutsideWeaponsmithScript
  protected

  def directions
    super + [
      "go weaponsmith|#{OUT}",
    ]
  end

  def location
    "weaponsmith_showroom|#{CROSSING}"
  end
end
