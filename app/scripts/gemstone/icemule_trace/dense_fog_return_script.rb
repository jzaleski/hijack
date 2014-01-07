require 'scripts/gemstone/icemule_trace/dense_fog_script'

class DenseFogReturnScript < DenseFogScript

  protected

  def directions
    reverse_directions(super)
  end

end
