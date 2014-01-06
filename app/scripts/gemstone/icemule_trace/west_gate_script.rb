require 'scripts/base/base_gemstone_icemule_trace_movement_script'

class WestGateScript < BaseGemstoneIcemuleTraceMovementScript

  protected

  def directions
    [
      WEST,
      WEST,
      WEST,
      WEST,
      WEST,
      "go gate|#{WEST}",
      "#{WEST}|go gate",
    ]
  end

  def location
    "west_gate|#{ICEMULE_TRACE}"
  end

end
