require 'scripts/gemstone/icemule_trace/silvermule_gaming_hall_script'

class HouseOfPaupersScript < SilvermuleGamingHallScript

  protected

  def directions
    super + [
      'go door',
      NORTH,
      NORTH,
      'go gooseberry arch',
    ]
  end

  def location
    "house_of_paupers|#{ICEMULE_TRACE}"
  end

end
