require 'scripts/base/base_gemstone_icemule_trace_movement_script'

class PawnshopScript < BaseGemstoneIcemuleTraceMovementScript

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
      EAST,
      'climb stairs',
      "go door|#{OUT}",
    ]
  end

  def location
    "pawnshop|#{ICEMULE_TRACE}"
  end

end
