require 'scripts/gemstone/wehnimers_landing/town_square_central_script'

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
