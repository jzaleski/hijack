require 'scripts/base/base_gemstone_icemule_trace_movement_script'

class ClovertoothHallScript < BaseGemstoneIcemuleTraceMovementScript

  protected

  def directions
    [
      EAST,
      EAST,
      SOUTH,
      "go hall|#{OUT}",
    ]
  end

  def location
    "clovertooth_hall|#{ICEMULE_TRACE}"
  end

end
