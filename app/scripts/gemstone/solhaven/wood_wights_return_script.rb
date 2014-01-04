require 'scripts/gemstone/solhaven/wood_wights_script'

class WoodWightsReturnScript < WoodWightsScript

  protected

  def directions
    reverse_directions(super)
  end

end
