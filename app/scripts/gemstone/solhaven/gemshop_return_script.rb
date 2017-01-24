require_reload 'scripts/gemstone/solhaven/gemshop_script'

class GemshopReturnScript < GemshopScript
  protected

  def directions
    reverse_directions(super)
  end
end
