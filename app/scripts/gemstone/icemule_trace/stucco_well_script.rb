load "#{SCRIPTS_DIR}/gemstone/icemule_trace/town_center_script.rb", true

class StuccoWellScript < TownCenterScript
  protected

  def directions
    [
      WEST,
      WEST,
      SOUTH,
      SOUTH,
    ]
  end

  def location
    "stucco_well|#{ICEMULE_TRACE}"
  end
end
