require 'scripts/gemstone/wehnimers_landing/mammoth_rockslide_script'

class IcemuleTraceScript < MammothRockslideScript

  protected

  def directions
    super + [
      'climb rockslide',
      EAST,
      NORTHEAST,
      NORTHEAST,
      NORTHEAST,
      EAST,
      NORTHEAST,
      NORTH,
      NORTH,
      NORTHEAST,
      NORTH,
      NORTHWEST,
      WEST,
      "go river|#{NORTH}",
      'climb bank',
      NORTHEAST,
      NORTHEAST,
      'go trail',
      NORTH,
      "climb tree|#{UP}",
      EAST,
      "#{DOWN}|climb branch",
      NORTH,
      NORTH,
      NORTHEAST,
      NORTHEAST,
      NORTHEAST,
      WEST,
      NORTHEAST,
      NORTH,
      NORTH,
      NORTH,
      EAST,
      NORTH,
      SOUTHEAST,
      EAST,
      EAST,
    ]
  end

  def location
    "south_gate|#{ICEMULE_TRACE}"
  end

end
