require 'scripts/gemstone/wehnimers_landing/town_square_central_script'

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
