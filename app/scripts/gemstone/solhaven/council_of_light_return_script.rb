load "#{APP_DIR}/scripts/gemstone/solhaven/council_of_light_script.rb", true

class CouncilOfLightReturnScript < CouncilOfLightScript
  protected

  def directions
    reverse_directions(super)
  end
end
