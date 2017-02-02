load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/town_square_central_script.rb", true

class AlchemistScript < TownSquareCentralScript
  protected

  def directions
    [
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
      "go bridge|#{EAST}",
      "#{EAST}|go bridge",
      EAST,
      EAST,
      NORTH,
      NORTH,
      NORTH,
      "go house|#{OUT}",
    ]
  end

  def location
    "alchemist|#{WEHNIMERS_LANDING}"
  end
end
