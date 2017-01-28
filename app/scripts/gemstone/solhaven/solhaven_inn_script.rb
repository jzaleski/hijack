load "#{APP_DIR}/scripts/gemstone/solhaven/north_market_script.rb", true

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
