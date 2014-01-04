require 'scripts/base/base_gemstone_icemule_trace_movement_script'

class GemshopScript < BaseGemstoneIcemuleTraceMovementScript

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
