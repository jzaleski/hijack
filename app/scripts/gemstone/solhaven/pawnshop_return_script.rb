require 'scripts/gemstone/solhaven/pawnshop_script'

class PawnshopReturnScript < PawnshopScript
  protected

  def directions
    reverse_directions(super)
  end
end
