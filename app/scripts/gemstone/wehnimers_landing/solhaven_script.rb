require_reload 'scripts/gemstone/wehnimers_landing/rocky_stream_script'

class SolhavenScript < RockyStreamScript
  protected

  def directions
    super + [
      'go stream',
      SOUTHWEST,
      SOUTHWEST,
      SOUTHWEST,
      SOUTH,
      SOUTH,
      SOUTHWEST,
      'go ford',
      SOUTH,
      SOUTH,
      SOUTH,
      SOUTH,
      SOUTHEAST,
      SOUTHEAST,
      SOUTHWEST,
      SOUTHWEST,
      SOUTH,
      SOUTHWEST,
      SOUTHWEST,
      SOUTH,
      SOUTH,
      SOUTHWEST,
      SOUTHEAST,
      UP,
      SOUTH,
      SOUTHWEST,
      SOUTH,
      DOWN,
      SOUTH,
      'go ramp',
      WEST,
      WEST,
      WEST,
      WEST,
      WEST,
      WEST,
      WEST,
      SOUTHWEST,
      SOUTHWEST,
      SOUTH,
      SOUTH,
      'go roadway',
      WEST,
      SOUTH,
      SOUTH,
      SOUTH,
      SOUTH,
      SOUTH,
      SOUTH,
      EAST,
      EAST,
      SOUTHEAST,
      SOUTH,
      SOUTHEAST,
      EAST,
      'go columns',
      UP,
      SOUTH,
      SOUTHEAST,
      EAST,
      EAST,
      SOUTH,
      SOUTH,
      SOUTH,
      SOUTH,
      SOUTHEAST,
      DOWN,
      DOWN,
      DOWN,
      DOWN,
      DOWN,
      DOWN,
      DOWN,
      SOUTHEAST,
      SOUTHWEST,
      SOUTHWEST,
      SOUTHWEST,
      "go bridge|#{SOUTHWEST}",
      "#{SOUTHWEST}|go bridge",
      SOUTHWEST,
      SOUTH,
      SOUTH,
      SOUTHWEST,
      SOUTHWEST,
      SOUTHWEST,
      SOUTHWEST,
      SOUTHWEST,
      SOUTH,
      SOUTH,
      SOUTH,
      SOUTH,
      SOUTHWEST,
      SOUTHWEST,
      SOUTHWEST,
      SOUTHWEST,
      SOUTHWEST,
      SOUTH,
      SOUTH,
      SOUTHWEST,
      WEST,
      WEST,
      WEST,
      WEST,
      WEST,
      NORTHWEST,
      WEST,
      'go ravine|go ramp',
      SOUTH,
      DOWN,
      SOUTHWEST,
      SOUTH,
      SOUTH,
      SOUTHWEST,
      "go bridge|#{SOUTHEAST}",
      UP,
      SOUTHEAST,
      SOUTHEAST,
      DOWN,
      SOUTHEAST,
      SOUTH,
    ]
  end

  def location
    "north_market|#{SOLHAVEN}"
  end
end
