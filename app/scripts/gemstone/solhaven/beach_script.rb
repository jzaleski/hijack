require 'scripts/gemstone/solhaven/muddy_trail_script'

class BeachScript < MuddyTrailScript

  protected

  def directions
    super + [
      WEST,
      WEST,
      WEST,
      WEST,
      WEST,
      WEST,
      SOUTHWEST,
      SOUTHWEST,
      WEST,
      WEST,
      WEST,
      WEST,
      WEST,
      "go bridge|#{WEST}",
      "#{WEST}|go bridge",
      WEST,
      WEST,
      WEST,
      WEST,
      WEST,
      WEST,
      SOUTHWEST,
      WEST,
      SOUTHWEST,
      WEST,
      WEST,
      WEST,
      WEST,
      SOUTHWEST,
      SOUTHWEST,
      WEST,
      WEST,
      WEST,
      WEST,
      WEST,
      WEST,
      WEST,
      WEST,
      'go path|go road',
      SOUTHWEST,
      SOUTHWEST,
      SOUTHWEST,
      SOUTHWEST,
      SOUTHWEST,
      SOUTHWEST,
      SOUTHWEST,
      'go beach|go path',
    ]
  end

  def location
    "beach|#{SOLHAVEN}"
  end

end
