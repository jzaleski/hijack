require 'scripts/base/base_gemstone_icemule_trace_movement_script'

class WellScript < BaseGemstoneIcemuleTraceMovementScript

  protected

  def directions
    [
      WEST,
      WEST,
      SOUTH,
      SOUTH,
    ]
  end

  def location
    "well|#{ICEMULE_TRACE}"
  end

end
