require 'scripts/gemstone/solhaven/north_market_script'

class CouncilOfLightScript < NorthMarketScript
  protected

  def directions
    [
      SOUTHEAST,
      SOUTHEAST,
      SOUTH,
      SOUTH,
      SOUTH,
      SOUTH,
      SOUTH,
      SOUTH,
      'climb wall',
    ]
  end

  def location
    "council_of_light|#{SOLHAVEN}"
  end
end
