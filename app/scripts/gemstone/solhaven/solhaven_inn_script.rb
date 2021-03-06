load "#{SCRIPTS_DIR}/gemstone/solhaven/north_market_script.rb", true

class SolhavenInnScript < NorthMarketScript
  protected

  def directions
    super + [
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
