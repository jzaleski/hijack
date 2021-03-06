load "#{SCRIPTS_DIR}/gemstone/solhaven/north_market_script.rb", true

class DaggerbeaksScript < NorthMarketScript
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
      NORTHEAST,
      NORTH,
      NORTH,
      NORTHEAST,
      UP,
      NORTH,
      'go ramp|go ravine',
      EAST,
      SOUTHEAST,
      EAST,
      EAST,
      EAST,
      "go bridge|#{SOUTH}",
      "#{SOUTH}|go bridge",
      EAST,
    ]
  end

  def location
    "daggerbeaks|#{SOLHAVEN}"
  end
end
