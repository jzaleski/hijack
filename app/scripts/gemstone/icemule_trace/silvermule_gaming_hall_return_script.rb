load "#{APP_DIR}/scripts/gemstone/icemule_trace/silvermule_gaming_hall_script.rb", true

class SilvermuleGamingHallReturnScript < SilvermuleGamingHallScript
  protected

  def directions
    reverse_directions(super)
  end
end
