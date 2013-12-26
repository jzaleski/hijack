require 'scripts/gemstone/solhaven/solhaven_inn_script'

class SolhavenInnReturnScript < SolhavenInnScript

  protected

  def directions
    reverse_directions(super)
  end

end
