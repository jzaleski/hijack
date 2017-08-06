load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/manticores_script.rb", true

class GreaterSpidersScript < ManticoresScript
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
    "greater_spiders|#{WEHNIMERS_LANDING}"
  end
end
