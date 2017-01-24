require_reload 'scripts/gemstone/icemule_trace/house_of_paupers_script'

class HouseOfPaupersReturnScript < HouseOfPaupersScript
  protected

  def directions
    reverse_directions(super)
  end
end
