load "#{SCRIPTS_DIR}/gemstone/icemule_trace/town_center_script.rb", true

class GemshopScript < TownCenterScript
  protected

  def directions
    super + [
      EAST,
      SOUTH,
      SOUTH,
      "go gemshop|#{OUT}",
    ]
  end

  def location
    "gemshop|#{ICEMULE_TRACE}"
  end
end
