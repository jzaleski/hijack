require 'scripts/gemstone/icemule_trace/snow_spectres_script'

class SnowSpectresReturnScript < SnowSpectresScript

  protected

  def directions
    reverse_directions(super)
  end

end
