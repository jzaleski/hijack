require_reload 'scripts/gemstone/solhaven/north_market_script'

class AdventurersGuildScript < NorthMarketScript
  protected

  def directions
    [
      NORTHEAST,
      EAST,
      EAST,
      NORTH,
      "go building|#{OUT}",
    ]
  end

  def location
    "adventurers_guild|#{SOLHAVEN}"
  end
end
