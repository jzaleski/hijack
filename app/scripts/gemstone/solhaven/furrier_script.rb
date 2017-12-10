load "#{SCRIPTS_DIR}/gemstone/solhaven/north_market_script.rb", true

class FurrierScript < NorthMarketScript
  protected

  def directions
    super + [
      SOUTHWEST,
      "go shop|#{OUT}",
    ]
  end

  def location
    "furrier|#{SOLHAVEN}"
  end
end
