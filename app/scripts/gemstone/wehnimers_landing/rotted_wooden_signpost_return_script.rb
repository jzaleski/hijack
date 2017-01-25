require 'scripts/gemstone/wehnimers_landing/rotted_wooden_signpost_script'

class RottedWoodenSignpostReturnScript < RottedWoodenSignpostScript
  protected

  def directions
    reverse_directions(super)
  end
end
