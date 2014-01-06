require 'scripts/gemstone/icemule_trace/wraiths_script'

class WraithsReturnScript < WraithsScript

  protected

  def directions
    reverse_directions(super)
  end

end
