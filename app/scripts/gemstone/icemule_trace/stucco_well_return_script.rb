require 'scripts/gemstone/icemule_trace/stucco_well_script'

class StuccoWellReturnScript < StuccoWellScript

  protected

  def directions
    reverse_directions(super)
  end

end
