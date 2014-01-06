require 'scripts/base/base_gemstone_icemule_trace_movement_script'

class EastGateScript < BaseGemstoneIcemuleTraceMovementScript

  protected

  def directions
    [
      EAST,
      EAST,
      EAST,
      EAST,
      EAST,
      "go gate|#{EAST}",
      "#{EAST}|go gate",
    ]
  end

  def location
    "east_gate|#{ICEMULE_TRACE}"
  end

end
