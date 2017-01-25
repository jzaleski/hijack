require 'scripts/gemstone/icemule_trace/gemshop_script'

class GemshopReturnScript < GemshopScript
  protected

  def directions
    reverse_directions(super)
  end
end
