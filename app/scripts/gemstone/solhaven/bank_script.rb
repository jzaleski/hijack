require 'scripts/gemstone/solhaven/north_market_script'

class BankScript < NorthMarketScript

  protected

  def directions
    [
      SOUTHEAST,
      EAST,
      "go bank|#{OUT}",
    ]
  end

  def location
    "bank|#{SOLHAVEN}"
  end

end
