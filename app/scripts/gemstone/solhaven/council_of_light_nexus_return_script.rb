load "#{SCRIPTS_DIR}/gemstone/solhaven/council_of_light_script.rb", true

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
