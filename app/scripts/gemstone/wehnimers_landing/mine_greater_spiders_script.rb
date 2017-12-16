load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/manticores_script.rb", true

class MineGreaterSpidersScript < ManticoresScript
  protected

  def directions
    super + [
      EAST,
      SOUTHWEST,
      SOUTHEAST,
      SOUTH,
      WEST,
      WEST,
      'go door',
      NORTH,
      NORTH,
      'go crevice',
    ]
  end

  def location
    "mine_greater_spiders|#{WEHNIMERS_LANDING}"
  end
end
