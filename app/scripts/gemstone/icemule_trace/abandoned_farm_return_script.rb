require 'scripts/gemstone/icemule_trace/abandoned_farm_script'

class AbandonedFarmReturnScript < AbandonedFarmScript
  protected

  def directions
    reverse_directions(super)
  end
end
