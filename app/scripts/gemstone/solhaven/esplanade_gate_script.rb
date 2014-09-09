require 'scripts/gemstone/solhaven/north_market_script'

class EsplanadeGateScript < NorthMarketScript
  protected

  def directions
    [
      SOUTHEAST,
      SOUTHEAST,
      SOUTH,
      EAST,
      EAST,
      EAST,
      EAST,
    ]
  end

  def location
    "esplanade_gate|#{SOLHAVEN}"
  end
end
