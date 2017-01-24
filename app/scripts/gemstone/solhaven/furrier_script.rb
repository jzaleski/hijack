require_reload 'scripts/gemstone/solhaven/north_market_script'

class FurrierScript < NorthMarketScript
  protected

  def directions
    [
      SOUTHWEST,
      "go shop|#{OUT}",
    ]
  end

  def location
    "furrier|#{SOLHAVEN}"
  end
end
