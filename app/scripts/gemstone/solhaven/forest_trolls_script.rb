load "#{SCRIPTS_DIR}/gemstone/solhaven/beach_script.rb", true

class ForestTrollsScript < BeachScript
  protected

  def directions
    super + [
      SOUTHEAST,
      SOUTHEAST,
      SOUTHEAST,
      SOUTHEAST,
      EAST,
      EAST,
      'go path',
    ]
  end

  def location
    "forest_trolls|#{SOLHAVEN}"
  end
end
