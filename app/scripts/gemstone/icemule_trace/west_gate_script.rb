load "#{SCRIPTS_DIR}/gemstone/icemule_trace/town_center_script.rb", true

class WestGateScript < TownCenterScript
  protected

  def directions
    [
      WEST,
      WEST,
      WEST,
      WEST,
      WEST,
      "go gate|#{WEST}",
      "#{WEST}|go gate",
    ]
  end

  def location
    "west_gate|#{ICEMULE_TRACE}"
  end
end
