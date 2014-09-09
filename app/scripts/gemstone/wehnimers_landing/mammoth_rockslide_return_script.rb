require 'scripts/gemstone/wehnimers_landing/mammoth_rockslide_script'

class MammothRockslideReturnScript < MammothRockslideScript
  protected

  def directions
    reverse_directions(super)
  end
end
