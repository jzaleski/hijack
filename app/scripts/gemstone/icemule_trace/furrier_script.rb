load "#{SCRIPTS_DIR}/gemstone/icemule_trace/town_center_script.rb", true

class FurrierScript < TownCenterScript
  protected

  def directions
    [
      EAST,
      EAST,
      EAST,
      EAST,
      SOUTH,
      WEST,
      SOUTHWEST,
      SOUTHEAST,
      "go furrier|#{OUT}",
    ]
  end

  def location
    "furrier|#{ICEMULE_TRACE}"
  end
end
