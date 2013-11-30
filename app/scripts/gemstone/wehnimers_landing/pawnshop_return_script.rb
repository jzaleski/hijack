require 'scripts/gemstone/wehnimers_landing/pawnshop_script'

class PawnshopReturnScript < PawnshopScript

  protected

  def directions
    reverse_directions(super)
  end

end
