require 'scripts/gemstone/solhaven/cavern_script'

class CavernReturnScript < CavernScript
  protected

  def directions
    reverse_directions(super)
  end
end
