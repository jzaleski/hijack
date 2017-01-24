require_reload 'scripts/gemstone/solhaven/alchemist_script'

class AlchemistReturnScript < AlchemistScript
  protected

  def directions
    reverse_directions(super)
  end
end
