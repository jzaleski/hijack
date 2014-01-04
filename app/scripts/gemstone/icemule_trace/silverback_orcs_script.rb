require 'scripts/base/base_gemstone_icemule_trace_movement_script'

class SilverbackOrcsScript < BaseGemstoneIcemuleTraceMovementScript

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
      EAST,
      NORTHEAST,
      "climb trail|#{UP}",
      UP,
      UP,
    ]
  end

  def location
    "silverback_orcs|#{ICEMULE_TRACE}"
  end

end
