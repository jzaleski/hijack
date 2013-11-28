require 'scripts/gemstone/rotting_corpses_script'

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

end
