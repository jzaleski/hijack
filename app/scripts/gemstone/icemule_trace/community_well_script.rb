require 'scripts/base/base_gemstone_icemule_trace_movement_script'

class CommunityWellScript < BaseGemstoneIcemuleTraceMovementScript

  protected

  def directions
    [
      WEST,
      WEST,
      SOUTH,
      SOUTHWEST,
      SOUTH,
      'climb well|climb lip',
    ]
  end

  def location
    "community_well|#{ICEMULE_TRACE}"
  end

end
