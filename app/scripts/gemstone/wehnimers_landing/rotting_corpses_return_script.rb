require 'scripts/gemstone/wehnimers_landing/rotting_corpses_script'

class RottingCorpsesReturnScript < RottingCorpsesScript

  protected

  def directions
    reverse_directions(super)
  end

end
