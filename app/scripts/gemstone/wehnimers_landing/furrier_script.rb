require 'scripts/gemstone/wehnimers_landing/town_square_central_script'

class FurrierScript < TownSquareCentralScript

  protected

  def directions
    [
      NORTHWEST,
      NORTH,
      NORTH,
      EAST,
      "go furrier|#{OUT}",
    ]
  end

  def location
    "furrier|#{WEHNIMERS_LANDING}"
  end

end
