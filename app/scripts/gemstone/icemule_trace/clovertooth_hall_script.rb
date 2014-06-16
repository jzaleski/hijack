require 'scripts/gemstone/icemule_trace/town_center_script'

class ClovertoothHallScript < TownCenterScript

  protected

  def directions
    [
      EAST,
      EAST,
      SOUTH,
      "go hall|#{OUT}",
    ]
  end

  def location
    "clovertooth_hall|#{ICEMULE_TRACE}"
  end

end
