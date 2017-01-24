require_reload 'scripts/gemstone/solhaven/council_of_light_script'

class CouncilOfLightNexusReturnScript < CouncilOfLightScript
  protected

  def directions
    [
      SOUTH,
      EAST,
      SOUTH,
      EAST,
      OUT,
    ] + reverse_directions(super)
  end
end
