require 'scripts/gemstone/solhaven/shelfae_soldiers_script'

class ShelfaeSoldiersReturnScript < ShelfaeSoldiersScript

  protected

  def directions
    reverse_directions(super)
  end

end
