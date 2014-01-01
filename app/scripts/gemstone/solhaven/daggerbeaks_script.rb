require 'scripts/base/base_gemstone_solhaven_movement_script'

class DaggerbeaksScript < BaseGemstoneSolhavenMovementScript

  protected

  def directions
    [
      NORTH,
      NORTHWEST,
      UP,
      NORTHWEST,
      NORTHWEST,
      DOWN,
      "#{NORTHWEST}|go bridge",
      NORTHEAST,
      NORTH,
      NORTH,
      NORTHEAST,
      UP,
      NORTH,
      'go ramp|go ravine',
      EAST,
      SOUTHEAST,
      EAST,
      EAST,
      EAST,
      "go bridge|#{SOUTH}",
      "#{SOUTH}|go bridge",
      EAST,
    ]
  end

  def location
    "daggerbeaks|#{SOLHAVEN}"
  end

end
