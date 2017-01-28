load "#{APP_DIR}/scripts/gemstone/solhaven/north_market_script.rb", true

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
