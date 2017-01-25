require 'scripts/gemstone/solhaven/council_of_light_script'

class CouncilOfLightReturnScript < CouncilOfLightScript
  protected

  def directions
    reverse_directions(super)
  end
end
