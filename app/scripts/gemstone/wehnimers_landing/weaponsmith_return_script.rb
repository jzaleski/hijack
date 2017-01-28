load "#{APP_DIR}/scripts/gemstone/wehnimers_landing/weaponsmith_script.rb", true

class WeaponsmithReturnScript < WeaponsmithScript
  protected

  def directions
    reverse_directions(super)
  end
end
