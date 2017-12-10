load "#{SCRIPTS_DIR}/gemstone/icemule_trace/town_center_script.rb", true

class ThirstyPenguinScript < TownCenterScript
  protected

  def directions
    super + [
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
