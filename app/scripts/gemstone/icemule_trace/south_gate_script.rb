require 'scripts/base/base_gemstone_icemule_trace_movement_script'

class SouthGateScript < BaseGemstoneIcemuleTraceMovementScript

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
