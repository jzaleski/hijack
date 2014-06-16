require 'scripts/gemstone/solhaven/north_market_script'

class SolhavenInnScript < NorthMarketScript

  protected

  def directions
    [
      EAST,
      EAST,
      EAST,
      "go inn|#{OUT}",
    ]
  end

  def location
    "solhaven_inn|#{SOLHAVEN}"
  end

end
