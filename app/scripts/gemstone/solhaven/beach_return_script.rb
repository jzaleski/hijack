require_reload 'scripts/gemstone/solhaven/beach_script'

class BeachReturnScript < BeachScript
  protected

  def directions
    reverse_directions(super)
  end
end
