load "#{SCRIPTS_DIR}/gemstone/icemule_trace/town_center_script.rb", true

class EastGateScript < TownCenterScript
  protected

  def directions
    super + [
      EAST,
      EAST,
      EAST,
      EAST,
      EAST,
      "go gate|#{EAST}",
      "#{EAST}|go gate",
    ]
  end

  def location
    "east_gate|#{ICEMULE_TRACE}"
  end
end
