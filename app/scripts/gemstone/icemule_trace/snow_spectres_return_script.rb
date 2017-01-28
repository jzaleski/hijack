load "#{APP_DIR}/scripts/gemstone/icemule_trace/snow_spectres_script.rb", true

class SnowSpectresReturnScript < SnowSpectresScript
  protected

  def directions
    reverse_directions(super)
  end
end
