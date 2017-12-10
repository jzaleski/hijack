load "#{SCRIPTS_DIR}/gemstone/icemule_trace/town_center_script.rb", true

class SouthGateScript < TownCenterScript
  protected

  def directions
    super + [
      SOUTH,
      SOUTH,
      SOUTH,
      SOUTH,
      SOUTH,
      "go gate|#{SOUTH}",
      "#{SOUTH}|go gate",
    ]
  end

  def location
    "south_gate|#{ICEMULE_TRACE}"
  end
end
