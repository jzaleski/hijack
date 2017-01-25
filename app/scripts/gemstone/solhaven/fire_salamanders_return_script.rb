require 'scripts/gemstone/solhaven/fire_salamanders_script'

class FireSalamandersReturnScript < FireSalamandersScript
  protected

  def directions
    reverse_directions(super)
  end
end
