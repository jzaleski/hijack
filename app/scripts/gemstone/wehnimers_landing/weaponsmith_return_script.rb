load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/weaponsmith_script.rb", true

class WeaponsmithReturnScript < WeaponsmithScript
  protected

  def directions
    reverse_directions(super)
  end
end
