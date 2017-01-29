load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/town_square_central_script.rb", true

class PawnshopScript < TownSquareCentralScript
  protected

  def directions
    [
      NORTHEAST,
      EAST,
      EAST,
      EAST,
      EAST,
      EAST,
      SOUTH,
      EAST,
      NORTH,
      "go pawnshop|#{OUT}",
    ]
  end

  def location
    "pawnshop|#{WEHNIMERS_LANDING}"
  end
end
