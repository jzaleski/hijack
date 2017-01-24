require_reload 'scripts/gemstone/icemule_trace/community_well_script'

class CommunityWellReturnScript < CommunityWellScript
  protected

  def directions
    reverse_directions(super)
  end
end
