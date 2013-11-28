require 'scripts/gemstone/skeletal_lords_script'

class SkeletalWarhorsesScript < SkeletalLordsScript

  protected

  def directions
    super + [
      NORTH,
      WEST,
      "go doors|#{OUT}",
    ]
  end

end
