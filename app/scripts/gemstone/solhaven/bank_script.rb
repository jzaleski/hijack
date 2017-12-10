load "#{SCRIPTS_DIR}/gemstone/solhaven/north_market_script.rb", true

class BankScript < NorthMarketScript
  protected

  def directions
    super + [
      SOUTHEAST,
      EAST,
      "go bank|#{OUT}",
    ]
  end

  def location
    "bank|#{SOLHAVEN}"
  end
end
