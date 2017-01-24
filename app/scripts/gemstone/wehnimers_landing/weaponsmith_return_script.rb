require_reload 'scripts/gemstone/wehnimers_landing/weaponsmith_script'

class WeaponsmithReturnScript < WeaponsmithScript
  protected

  def directions
    reverse_directions(super)
  end
end
