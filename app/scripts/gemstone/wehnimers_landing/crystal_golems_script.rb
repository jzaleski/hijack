load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/manticores_script.rb", true

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

  def location
    "crystal_golems|#{WEHNIMERS_LANDING}"
  end
end
