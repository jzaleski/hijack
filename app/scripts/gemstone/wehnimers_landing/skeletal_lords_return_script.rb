require_reload 'scripts/gemstone/wehnimers_landing/skeletal_lords_script'

class SkeletalLordsReturnScript < SkeletalLordsScript
  protected

  def directions
    reverse_directions(super)
  end
end
