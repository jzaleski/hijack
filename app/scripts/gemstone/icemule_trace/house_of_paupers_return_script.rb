load "#{APP_DIR}/scripts/gemstone/icemule_trace/house_of_paupers_script.rb", true

class HouseOfPaupersReturnScript < HouseOfPaupersScript
  protected

  def directions
    reverse_directions(super)
  end
end
