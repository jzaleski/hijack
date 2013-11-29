require 'scripts/gemstone/solhaven_script'

class SolhavenReturnScript < SolhavenScript

  protected

  def directions
    reverse_directions(super)
  end

end
