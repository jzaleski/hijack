load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/town_square_central_script.rb", true

class TempleScript < TownSquareCentralScript
  protected

  def directions
    [
      EAST,
      EAST,
      EAST,
      SOUTH,
      SOUTH,
      EAST,
      "go temple|#{OUT}",
    ]
  end

  def location
    "temple|#{WEHNIMERS_LANDING}"
  end
end
