load "#{SCRIPTS_DIR}/gemstone/icemule_trace/town_center_script.rb", true

class PawnshopScript < TownCenterScript
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
      EAST,
      'climb stairs',
      "go door|#{OUT}",
    ]
  end

  def location
    "pawnshop|#{ICEMULE_TRACE}"
  end
end
