require 'scripts/gemstone/icemule_trace/silverback_orcs_script'

class SilverbackOrcsReturnScript < SilverbackOrcsScript
  protected

  def directions
    reverse_directions(super)
  end
end
