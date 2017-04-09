load "#{SCRIPTS_DIR}/dragonrealms/crossing/outside_weaponsmith_script.rb", true

class OutsideFurrierScript < OutsideWeaponsmithScript
  protected

  def directions
    super + [
      NORTH,
      NORTH,
      NORTH,
      WEST,
      WEST,
      NORTH,
      NORTH,
      WEST,
    ]
  end

  def location
    "outside_furrier|#{CROSSING}"
  end
end
