require 'scripts/gemstone/wehnimers_landing/icemule_trace_script'

class WehnimersLandingScript < IcemuleTraceScript

  protected

  def directions
    reverse_directions(super)
  end

  def location
    "town_square_central|#{WEHNIMERS_LANDING}"
  end

end
