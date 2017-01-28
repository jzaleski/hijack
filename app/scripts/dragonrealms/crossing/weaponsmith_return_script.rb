load "#{APP_DIR}/scripts/dragonrealms/crossing/weaponsmith_script.rb", true

class WeaponsmithReturnScript < WeaponsmithScript
  protected

  def directions
    reverse_directions(super)
  end
end
