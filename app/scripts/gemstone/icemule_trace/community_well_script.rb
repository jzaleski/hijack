require_reload 'scripts/gemstone/icemule_trace/town_center_script'

class CommunityWellScript < TownCenterScript
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
