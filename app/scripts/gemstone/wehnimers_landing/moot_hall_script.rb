load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/town_square_central_script.rb", true

class MootHallScript < TownSquareCentralScript
  protected

  def directions
    super + [
      EAST,
      "go hall|#{OUT}",
    ]
  end

  def location
    "moot_hall|#{WEHNIMERS_LANDING}"
  end
end
