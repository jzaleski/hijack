load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/town_square_central_script.rb", true

class RogueGuildScript < TownSquareCentralScript
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
      EAST,
      NORTH,
      EAST,
      EAST,
      SOUTH,
      "go hall|#{OUT}",
      'go door',
      "go panel|#{OUT}",
    ]
  end

  def location
    "rogue_guild|#{WEHNIMERS_LANDING}"
  end
end
