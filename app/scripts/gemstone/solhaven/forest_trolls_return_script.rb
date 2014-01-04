require 'scripts/gemstone/solhaven/forest_trolls_script'

class ForestTrollsReturnScript < ForestTrollsScript

  protected

  def directions
    reverse_directions(super)
  end

end
