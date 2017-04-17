load "#{SCRIPTS_DIR}/dragonrealms/crossing/outside_weaponsmith_script.rb", true

class ReflexScript < OutsideWeaponsmithScript
  protected

  def directions
    super + [
      EAST,
      'go path',
      "go juggling academy|#{OUT}",
    ]
  end

  def location
    "reflex|#{CROSSING}"
  end
end
