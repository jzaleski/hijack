load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/town_square_central_script.rb", true

class AdventurersGuildScript < TownSquareCentralScript
  protected

  def directions
    super + [
      NORTHEAST,
      EAST,
      EAST,
      NORTH,
      NORTH,
      EAST,
      EAST,
      EAST,
      EAST,
      EAST,
      "go building|#{OUT}",
    ]
  end

  def location
    "adventurers_guild|#{WEHNIMERS_LANDING}"
  end
end
