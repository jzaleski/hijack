require_reload 'scripts/gemstone/solhaven/breach_script'

class BreachReturnScript < BreachScript
  protected

  def directions
    reverse_directions(super)
  end
end
