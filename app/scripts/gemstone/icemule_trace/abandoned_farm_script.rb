load "#{SCRIPTS_DIR}/gemstone/icemule_trace/south_gate_script.rb", true

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
