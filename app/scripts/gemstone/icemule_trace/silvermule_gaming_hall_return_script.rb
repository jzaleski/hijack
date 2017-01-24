require_reload 'scripts/gemstone/icemule_trace/silvermule_gaming_hall_script'

class SilvermuleGamingHallReturnScript < SilvermuleGamingHallScript
  protected

  def directions
    reverse_directions(super)
  end
end
