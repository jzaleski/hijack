require 'scripts/gemstone/wehnimers_landing/rotting_corpses_script'

class SkeletalLordsScript < RottingCorpsesScript
  protected

  def directions
    super + [
      NORTH,
      'go drawbridge',
      NORTH,
      NORTH,
      EAST,
      EAST,
      EAST,
      EAST,
      NORTH,
      NORTH,
      WEST,
      'go ramp',
    ]
  end

  def location
    "skeletal_lords|#{WEHNIMERS_LANDING}"
  end
end
