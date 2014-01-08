require 'scripts/base/base_gemstone_icemule_trace_movement_script'

class ThirstyPenguinScript < BaseGemstoneIcemuleTraceMovementScript

  protected

  def directions
    [
      WEST,
      WEST,
      SOUTH,
      "go door|#{OUT}",
    ]
  end

  def location
    "thirsty_penguin|#{ICEMULE_TRACE}"
  end

end
