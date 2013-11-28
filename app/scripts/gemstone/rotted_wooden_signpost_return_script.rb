require 'scripts/gemstone/rotted_wooden_signpost_script'

class RottedWoodenSignpostReturnScript < RottedWoodenSignpostScript

  protected

  def directions
    reverse_directions(super)
  end

end
