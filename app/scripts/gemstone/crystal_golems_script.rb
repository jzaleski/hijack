require 'scripts/gemstone/manticores_script'

class CrystalGolemsScript < ManticoresScript

  protected

  def directions
    super + [
      EAST,
      SOUTHWEST,
      SOUTHEAST,
      SOUTH,
      WEST,
      WEST,
      'go door',
      NORTH,
      NORTH,
      NORTH,
      NORTH,
      NORTH,
      NORTH,
      NORTH,
      NORTH,
      EAST,
      EAST,
      EAST,
      'go step',
      EAST,
      NORTH,
      'go fissure',
    ]
  end

end
