require 'scripts/gemstone/icemule_trace/icy_trench_script'

class IcyTrenchReturnScript < IcyTrenchScript
  protected

  def directions
    reverse_directions(super)
  end
end
