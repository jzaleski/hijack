load "#{SCRIPTS_DIR}/gemstone/icemule_trace/community_well_script.rb", true

class CommunityWellReturnScript < CommunityWellScript
  protected

  def directions
    reverse_directions(super)
  end
end
