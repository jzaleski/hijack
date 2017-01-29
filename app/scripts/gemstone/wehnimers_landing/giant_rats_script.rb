load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/fire_salamanders_script.rb", true

class GiantRatsScript < FireSalamandersScript
  protected

  def directions
    super + [
      EAST,
      EAST,
      EAST,
      EAST,
      'go root',
      EAST,
      EAST,
      EAST,
      EAST,
      NORTH,
      'go grate',
    ]
  end

  def location
    "giant_rats|#{WEHNIMERS_LANDING}"
  end
end
