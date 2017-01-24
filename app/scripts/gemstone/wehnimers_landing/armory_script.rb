require_reload 'scripts/gemstone/wehnimers_landing/town_square_central_script'

class ArmoryScript < TownSquareCentralScript
  protected

  def directions
    [
      SOUTHWEST,
      WEST,
      "go door|#{OUT}",
    ]
  end

  def location
    "armory|#{WEHNIMERS_LANDING}"
  end
end
