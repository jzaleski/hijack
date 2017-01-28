load "#{APP_DIR}/scripts/gemstone/wehnimers_landing/town_square_central_script.rb", true

class WeaponsmithScript < TownSquareCentralScript
  protected

  def directions
    [
      NORTHEAST,
      "go door|#{OUT}",
    ]
  end

  def location
    "weaponsmith|#{WEHNIMERS_LANDING}"
  end
end
