require 'scripts/gemstone/icemule_trace/silverback_orcs_script'

class SnowSpectresScript < SilverbackOrcsScript

  protected

  def directions
    super + [
      EAST,
      SOUTHEAST,
      NORTH,
      NORTHEAST,
      NORTHEAST,
      EAST,
      SOUTHEAST,
      "go bridge|#{WEST}",
      'go arch',
    ]
  end

  def location
    "snow_spectres|#{ICEMULE_TRACE}"
  end

end
