require 'scripts/gemstone/wehnimers_landing/rocky_stream_script'

class RottingCorpsesScript < RockyStreamScript
  protected

  def directions
    super + [
      'go grass',
      EAST,
      NORTHEAST,
      NORTH,
      'go drawbridge',
    ]
  end

  def location
    "rotting_corpses|#{WEHNIMERS_LANDING}"
  end
end
