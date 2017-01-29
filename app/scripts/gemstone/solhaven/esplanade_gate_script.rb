load "#{SCRIPTS_DIR}/gemstone/solhaven/north_market_script.rb", true

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
