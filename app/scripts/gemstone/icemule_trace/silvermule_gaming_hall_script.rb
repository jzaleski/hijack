load "#{SCRIPTS_DIR}/gemstone/icemule_trace/town_center_script.rb", true

class SilvermuleGamingHallScript < TownCenterScript
  protected

  def directions
    super + [
      SOUTH,
      WEST,
      SOUTH,
      SOUTH,
      "go entry|#{OUT}",
    ]
  end

  def location
    "silvermule_gaming_hall|#{ICEMULE_TRACE}"
  end
end
