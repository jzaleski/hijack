require 'scripts/base/base_gemstone_icemule_trace_movement_script'

class FurrierScript < BaseGemstoneIcemuleTraceMovementScript

  protected

  def directions
    [
      EAST,
      EAST,
      EAST,
      EAST,
      SOUTH,
      WEST,
      SOUTHWEST,
      SOUTHEAST,
      "go furrier|#{OUT}",
    ]
  end

  def location
    "furrier|#{ICEMULE_TRACE}"
  end

end
