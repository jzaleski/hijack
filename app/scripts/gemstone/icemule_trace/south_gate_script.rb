require 'scripts/gemstone/icemule_trace/town_center_script'

class SouthGateScript < TownCenterScript

  protected

  def directions
    [
      SOUTH,
      SOUTH,
      SOUTH,
      SOUTH,
      SOUTH,
      "go gate|#{SOUTH}",
      "#{SOUTH}|go gate",
    ]
  end

  def location
    "south_gate|#{ICEMULE_TRACE}"
  end

end
