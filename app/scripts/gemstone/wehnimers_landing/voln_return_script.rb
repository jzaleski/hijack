require 'scripts/gemstone/wehnimers_landing/voln_script'

class VolnReturnScript < VolnScript
  protected

  def directions
    reverse_directions(super)
  end
end
