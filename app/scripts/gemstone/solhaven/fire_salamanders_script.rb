require 'scripts/gemstone/solhaven/manticores_script'

class FireSalamandersScript < ManticoresScript
  protected

  def directions
    super + [
      NORTH,
      NORTHWEST,
      NORTHWEST,
      NORTH,
      NORTH,
      NORTHWEST,
      WEST,
      WEST,
      WEST,
      NORTHWEST,
      NORTHWEST,
      NORTH,
      NORTHWEST,
      NORTHWEST,
      WEST,
      NORTHWEST,
      'climb path',
    ]
  end

  def location
    "fire_salamanders|#{SOLHAVEN}"
  end
end
