require 'scripts/gemstone/solhaven/muddy_trail_script'

class MuddyTrailReturnScript < MuddyTrailScript

  protected

  def directions
    reverse_directions(super)
  end

end
