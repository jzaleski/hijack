require 'scripts/gemstone/wehnimers_landing/skeletal_warhorses_script'

class SkeletalWarhorsesReturnScript < SkeletalWarhorsesScript

  protected

  def directions
    reverse_directions(super)
  end

end
