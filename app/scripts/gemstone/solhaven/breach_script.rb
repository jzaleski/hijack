require 'scripts/base/base_gemstone_solhaven_movement_script'

class BreachScript < BaseGemstoneSolhavenMovementScript

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
      WEST,
      NORTH,
      NORTHWEST,
      WEST,
      WEST,
      NORTHWEST,
      'go path',
      UP,
      'go brush',
      NORTH,
      NORTH,
      NORTH,
      NORTH,
      'go breach',
    ]
  end

  def location
    "breach|#{SOLHAVEN}"
  end

end
