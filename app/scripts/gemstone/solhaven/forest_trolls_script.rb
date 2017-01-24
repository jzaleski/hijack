require_reload 'scripts/gemstone/solhaven/beach_script'

class ForestTrollsScript < BeachScript
  protected

  def directions
    super + [
      SOUTHEAST,
      SOUTHEAST,
      SOUTHEAST,
      SOUTHEAST,
      EAST,
      EAST,
      'go path',
    ]
  end

  def location
    "forest_trolls|#{SOLHAVEN}"
  end
end
