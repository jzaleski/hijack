load "#{SCRIPTS_DIR}/gemstone/solhaven/north_market_script.rb", true

class BreachScript < NorthMarketScript
  protected

  def directions
    super + [
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
