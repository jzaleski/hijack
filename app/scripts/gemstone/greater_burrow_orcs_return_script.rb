require 'scripts/gemstone/greater_burrow_orcs_script'

class GreaterBurrowOrcsReturnScript < GreaterBurrowOrcsScript

  protected

  def directions
    reverse_directions(super)
  end

end
