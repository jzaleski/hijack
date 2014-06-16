require 'scripts/gemstone/icemule_trace/town_center_script'

class DenseFogScript < TownCenterScript

  protected

  def directions
    [
      NORTH,
      WEST,
      NORTHWEST,
      SOUTHWEST,
      NORTHWEST,
      NORTHWEST,
      EAST,
      "go fog|#{DOWN}",
    ]
  end

  def location
    "dense_fog|#{ICEMULE_TRACE}"
  end

end
