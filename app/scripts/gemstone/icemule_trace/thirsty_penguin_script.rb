require_reload 'scripts/gemstone/icemule_trace/town_center_script'

class ThirstyPenguinScript < TownCenterScript
  protected

  def directions
    [
      WEST,
      WEST,
      SOUTH,
      "go door|#{OUT}",
    ]
  end

  def location
    "thirsty_penguin|#{ICEMULE_TRACE}"
  end
end
