load "#{SCRIPTS_DIR}/gemstone/icemule_trace/town_center_script.rb", true

class ClovertoothHallScript < TownCenterScript
  protected

  def directions
    super + [
      EAST,
      EAST,
      SOUTH,
      "go hall|#{OUT}",
    ]
  end

  def location
    "clovertooth_hall|#{ICEMULE_TRACE}"
  end
end
