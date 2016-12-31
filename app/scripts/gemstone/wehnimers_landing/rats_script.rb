require 'scripts/gemstone/wehnimers_landing/town_square_central_script'

class RatsScript < TownSquareCentralScript
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
      SOUTH,
      'go open',
      EAST,
      'go hole',
      'go open',
      EAST,
      NORTH,
      'go grate',
    ]
  end

  def location
    "rats|#{WEHNIMERS_LANDING}"
  end
end
