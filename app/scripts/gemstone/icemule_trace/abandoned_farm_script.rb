require_reload 'scripts/gemstone/icemule_trace/south_gate_script'

class AbandonedFarmScript < SouthGateScript
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
    ]
  end

  def location
    "abandoned_farm|#{ICEMULE_TRACE}"
  end
end
