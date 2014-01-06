require 'scripts/gemstone/icemule_trace/well_script'

class WellReturnScript < WellScript

  protected

  def directions
    reverse_directions(super)
  end

end
