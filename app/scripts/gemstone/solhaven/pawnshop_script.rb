load "#{APP_DIR}/scripts/gemstone/solhaven/north_market_script.rb", true

class PawnshopScript < NorthMarketScript
  protected

  def directions
    [
      SOUTHWEST,
      SOUTH,
      "go shop|#{OUT}",
    ]
  end

  def location
    "pawnshop|#{SOLHAVEN}"
  end
end
