require 'scripts/gemstone/wehnimers_landing/firephantoms_script'

class FirephantomsReturnScript < FirephantomsScript
  protected

  def directions
    reverse_directions(super)
  end
end
