require 'scripts/gemstone/solhaven/muddy_path_script'

class MuddyPathReturnScript < MuddyPathScript

  protected

  def directions
    reverse_directions(super)
  end

end
