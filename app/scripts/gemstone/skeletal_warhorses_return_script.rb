require 'scripts/gemstone/skeletal_warhorses_script'

class SkeletalWarhorsesReturnScript < SkeletalWarhorsesScript

  protected

  def directions
    reverse_directions(super)
  end

end
