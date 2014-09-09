require 'scripts/gemstone/solhaven/muddy_path_script'

class MuddyTrailScript < MuddyPathScript
  protected

  def directions
    super + [
      WEST,
      WEST,
      WEST,
      WEST,
      WEST,
      WEST,
      SOUTHWEST,
      WEST,
    ]
  end

  def location
    "muddy_trail|#{SOLHAVEN}"
  end
end
