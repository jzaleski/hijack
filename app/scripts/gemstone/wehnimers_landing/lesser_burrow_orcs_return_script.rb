require 'scripts/gemstone/wehnimers_landing/lesser_burrow_orcs_script'

class LesserBurrowOrcsReturnScript < LesserBurrowOrcsScript

  protected

  def directions
    reverse_directions(super)
  end

end
