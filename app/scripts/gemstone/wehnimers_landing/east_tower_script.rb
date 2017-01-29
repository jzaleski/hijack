load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/town_square_central_script.rb", true

class EastTowerScript < TownSquareCentralScript
  protected

  def directions
    [
      NORTHWEST,
      NORTH,
      NORTH,
      EAST,
      NORTH,
      "go east tower|#{OUT}",
    ]
  end

  def location
    "east_tower|#{WEHNIMERS_LANDING}"
  end
end
