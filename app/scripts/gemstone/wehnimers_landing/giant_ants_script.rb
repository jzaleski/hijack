require_reload 'scripts/gemstone/wehnimers_landing/fire_salamanders_script'

class GiantAntsScript < FireSalamandersScript
  protected

  def directions
    super + [
      EAST,
      SOUTHWEST,
      WEST,
      'go crack',
      SOUTHWEST,
      NORTH,
      NORTH,
      NORTHWEST,
      WEST,
      WEST,
      NORTHWEST,
      NORTH,
      NORTH,
    ]
  end

  def location
    "giant_ants|#{WEHNIMERS_LANDING}"
  end
end
