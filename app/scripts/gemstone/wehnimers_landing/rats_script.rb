require 'scripts/gemstone/wehnimers_landing/fire_salamanders_script'

class RatsScript < FireSalamandersScript
  protected

  def directions
    super + [
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
    "rats|#{WEHNIMERS_LANDING}"
  end
end
