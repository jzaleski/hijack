require 'scripts/base/base_gemstone_icemule_trace_movement_script'

class SilvermuleGamingHallScript < BaseGemstoneIcemuleTraceMovementScript

  protected

  def directions
    [
      SOUTH,
      WEST,
      SOUTH,
      SOUTH,
      "go entry|#{OUT}",
    ]
  end

  def location
    "silvermule_gaming_hall|#{ICEMULE_TRACE}"
  end

end
