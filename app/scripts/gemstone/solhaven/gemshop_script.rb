load "#{SCRIPTS_DIR}/gemstone/solhaven/north_market_script.rb", true

class GemshopScript < NorthMarketScript
  protected

  def directions
    super + [
      NORTHEAST,
      "go door|#{OUT}",
    ]
  end

  def location
    "gemshop|#{SOLHAVEN}"
  end
end
