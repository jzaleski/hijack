load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/town_square_central_script.rb", true

class HealersTentScript < TownSquareCentralScript
  protected

  def directions
    [
      NORTHEAST,
      EAST,
      EAST,
      EAST,
      EAST,
      EAST,
      NORTH,
      NORTH,
      "go tent|#{OUT}",
    ]
  end

  def location
    "healers_tent|#{WEHNIMERS_LANDING}"
  end
end
