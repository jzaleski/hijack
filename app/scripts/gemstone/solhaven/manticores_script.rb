require 'scripts/gemstone/solhaven/beach_script'

class ManticoresScript < BeachScript

  protected

  def directions
    super + [
      WEST,
      'go path',
      "go cavern|#{OUT}",
      NORTHEAST,
      EAST,
      NORTHEAST,
      SOUTH,
      UP,
    ]
  end

  def location
    "manticores|#{SOLHAVEN}"
  end

end
