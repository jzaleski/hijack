load "#{APP_DIR}/scripts/gemstone/wehnimers_landing/icemule_trace_script.rb", true

class WehnimersLandingScript < IcemuleTraceScript
  protected

  def directions
    reverse_directions(super)
  end

  def location
    "town_square_central|#{WEHNIMERS_LANDING}"
  end
end
