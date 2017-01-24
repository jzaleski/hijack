require_reload 'scripts/gemstone/solhaven/north_market_script'

class GemshopScript < NorthMarketScript
  protected

  def directions
    [
      NORTHEAST,
      "go door|#{OUT}",
    ]
  end

  def location
    "gemshop|#{SOLHAVEN}"
  end
end
