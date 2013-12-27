require 'scripts/gemstone/solhaven/breach_script'

class BeachScript < BreachScript

  protected

  def directions
    super + [
      'go door',
      WEST,
      WEST,
      SOUTHWEST,
      WEST,
      SOUTHWEST,
      WEST,
      WEST,
      WEST,
      WEST,
      WEST,
      SOUTHWEST,
      WEST,
      WEST,
      WEST,
      WEST,
      WEST,
      WEST,
      WEST,
      WEST,
      SOUTHWEST,
      WEST,
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
