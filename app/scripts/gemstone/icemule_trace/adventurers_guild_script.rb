require 'scripts/base/base_gemstone_icemule_trace_movement_script'

class AdventurersGuildScript < BaseGemstoneIcemuleTraceMovementScript

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
