load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/moot_hall_script.rb", true

class TownClerkScript < MootHallScript
  protected

  def directions
    super + [
      "go office|#{OUT}",
      EAST,
    ]
  end

  def location
    "town_clerk|#{WEHNIMERS_LANDING}"
  end
end
