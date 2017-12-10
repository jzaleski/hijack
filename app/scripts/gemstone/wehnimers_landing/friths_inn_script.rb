load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/town_square_central_script.rb", true

class FrithsInnScript < TownSquareCentralScript
  protected

  def directions
    super + [
      EAST,
      EAST,
      EAST,
      NORTH,
      EAST,
      EAST,
      SOUTH,
      SOUTHEAST,
      EAST,
      EAST,
      NORTH,
      "go inn|#{OUT}",
    ]
  end

  def location
    "friths_inn|#{WEHNIMERS_LANDING}"
  end
end
