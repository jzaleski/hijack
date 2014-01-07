require 'scripts/base/base_gemstone_icemule_trace_movement_script'

class StuccoWellScript < BaseGemstoneIcemuleTraceMovementScript

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
    "stucco_well|#{ICEMULE_TRACE}"
  end

end
