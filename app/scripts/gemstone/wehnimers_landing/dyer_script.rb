load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/town_square_central_script.rb", true

class DyerScript < TownSquareCentralScript
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
      EAST,
      EAST,
      "go tent|#{OUT}",
    ]
  end

  def location
    "dyer|#{WEHNIMERS_LANDING}"
  end
end
