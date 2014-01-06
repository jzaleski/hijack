require 'scripts/gemstone/icemule_trace/south_gate_script'

class WraithsScript < SouthGateScript

  protected

  def directions
    super + [
      'climb snowbank',
      SOUTH,
      SOUTHWEST,
      SOUTH,
      DOWN,
      SOUTH,
      EAST,
      EAST,
      NORTHWEST,
      UP,
      NORTH,
      NORTH,
      NORTH,
      'go archway',
      'go barn|go door',
    ]
  end

  def location
    "wraiths|#{ICEMULE_TRACE}"
  end

end
