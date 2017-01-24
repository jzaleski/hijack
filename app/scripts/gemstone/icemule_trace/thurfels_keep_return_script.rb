require_reload 'scripts/gemstone/icemule_trace/thurfels_keep_script'

class ThurfelsKeepReturnScript < ThurfelsKeepScript
  protected

  def directions
    reverse_directions(super)
  end
end
