load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/town_square_central_script.rb", true

class FireSalamandersScript < TownSquareCentralScript
  protected

  def directions
    super + [
      "go well|#{NORTH}",
      'climb rope',
      SOUTH,
      'go rubble',
    ]
  end

  def location
    "fire_salamanders|#{WEHNIMERS_LANDING}"
  end
end
