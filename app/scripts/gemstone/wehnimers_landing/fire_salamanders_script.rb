require_reload 'scripts/gemstone/wehnimers_landing/town_square_central_script'

class FireSalamandersScript < TownSquareCentralScript
  protected

  def directions
    [
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
