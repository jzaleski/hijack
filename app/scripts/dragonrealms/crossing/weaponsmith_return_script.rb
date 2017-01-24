require_reload 'scripts/dragonrealms/crossing/weaponsmith_script'

class WeaponsmithReturnScript < WeaponsmithScript
  protected

  def directions
    reverse_directions(super)
  end
end
