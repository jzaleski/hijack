require 'scripts/gemstone/wehnimers_landing/gemshop_script'

class GemshopReturnScript < GemshopScript
  protected

  def directions
    reverse_directions(super)
  end
end
