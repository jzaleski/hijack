load "#{SCRIPTS_DIR}/dragonrealms/crossing/outside_weaponsmith_script.rb", true

class OutsideEmpathsGuildScript < OutsideWeaponsmithScript
  protected

  def directions
    super + [
      NORTH,
      NORTH,
      NORTH,
      EAST,
      EAST,
      NORTH,
    ]
  end

  def location
    "outside_empaths_guild|#{CROSSING}"
  end
end
