require 'scripts/gemstone/icemule_trace/town_center_script'

class GemshopScript < TownCenterScript

  protected

  def directions
    [
      EAST,
      SOUTH,
      SOUTH,
      "go gemshop|#{OUT}",
    ]
  end

  def location
    "gemshop|#{ICEMULE_TRACE}"
  end

end
