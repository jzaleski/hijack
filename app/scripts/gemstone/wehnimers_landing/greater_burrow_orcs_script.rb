require 'scripts/gemstone/wehnimers_landing/lesser_burrow_orcs_script'

class GreaterBurrowOrcsScript < LesserBurrowOrcsScript

  protected

  def directions
    super + [
      SOUTHWEST,
      SOUTHEAST,
      SOUTH,
      WEST,
      WEST,
      SOUTHWEST,
      EAST,
      EAST,
      SOUTH,
      SOUTHWEST,
      SOUTH,
      WEST,
      SOUTH,
      SOUTHWEST,
      NORTH,
      NORTHWEST,
      NORTH,
      NORTHWEST,
      'go crevice',
    ]
  end

end
