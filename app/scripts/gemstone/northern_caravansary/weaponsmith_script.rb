load "#{SCRIPTS_DIR}/gemstone/northern_caravansary/green_script.rb", true

class WeaponsmithScript < GreenScript
  protected

  def directions
    [
      SOUTHEAST,
      "go wooden steps|#{OUT}",
    ]
  end

  def location
    "weaponsmith|#{NORTHERN_CARAVANSARY}"
  end
end
