require 'scripts/gemstone/wehnimers_landing/skeletal_lords_script'

class SkeletalWarhorsesScript < SkeletalLordsScript

  protected

  def directions
    super + [
      NORTH,
      WEST,
      "go doors|#{OUT}",
    ]
  end

  def location
    "skeletal_warhorses|#{WEHNIMERS_LANDING}"
  end

end
