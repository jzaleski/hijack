require 'scripts/base/base_gemstone_icemule_trace_movement_script'

class DenseFogScript < BaseGemstoneIcemuleTraceMovementScript

  protected

  def directions
    [
      NORTH,
      WEST,
      NORTHWEST,
      SOUTHWEST,
      NORTHWEST,
      NORTHWEST,
      EAST,
      "go fog|#{DOWN}",
    ]
  end

  def location
    "dense_fog|#{ICEMULE_TRACE}"
  end

end
