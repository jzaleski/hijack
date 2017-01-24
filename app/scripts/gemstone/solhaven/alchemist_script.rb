require_reload 'scripts/gemstone/solhaven/north_market_script'

class AlchemistScript < NorthMarketScript
  protected

  def directions
    [
      NORTH,
      NORTHEAST,
      NORTHEAST,
      NORTHEAST,
      NORTHEAST,
      'go steps',
      SOUTH,
      'go steps',
      UP,
      NORTH,
      'go steps',
      UP,
      SOUTH,
      "go cottage|#{OUT}",
    ]
  end

  def location
    "alchemist|#{SOLHAVEN}"
  end
end
