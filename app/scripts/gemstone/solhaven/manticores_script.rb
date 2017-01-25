require 'scripts/gemstone/solhaven/cavern_script'

class ManticoresScript < CavernScript
  protected

  def directions
    super + [
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
