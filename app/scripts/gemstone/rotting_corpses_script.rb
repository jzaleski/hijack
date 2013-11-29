require 'scripts/gemstone/rocky_stream_script'

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

end
