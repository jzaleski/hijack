require 'scripts/gemstone/solhaven/north_market_script'

class BreachScript < NorthMarketScript

  protected

  def directions
    [
      NORTH,
      NORTHWEST,
      UP,
      NORTHWEST,
      NORTHWEST,
      DOWN,
      "#{NORTHWEST}|go bridge",
      WEST,
      NORTH,
      NORTHWEST,
      WEST,
      WEST,
      NORTHWEST,
      'go path',
      UP,
      'go brush',
      NORTH,
      NORTH,
      NORTH,
      NORTH,
      'go breach',
    ]
  end

  def location
    "breach|#{SOLHAVEN}"
  end

end
