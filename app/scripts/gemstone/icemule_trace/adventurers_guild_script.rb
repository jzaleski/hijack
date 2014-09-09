require 'scripts/gemstone/icemule_trace/town_center_script'

class AdventurersGuildScript < TownCenterScript
  protected

  def directions
    [
      EAST,
      EAST,
      "go guild|#{OUT}",
    ]
  end

  def location
    "adventurers_guild|#{ICEMULE_TRACE}"
  end
end
