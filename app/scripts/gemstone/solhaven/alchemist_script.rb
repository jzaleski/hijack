require 'scripts/base/base_gemstone_solhaven_movement_script'

class AlchemistScript < BaseGemstoneSolhavenMovementScript

  protected

  def directions
    [
      NORTH,
      NORTHEAST,
      NORTHEAST,
      NORTHEAST,
      NORTHEAST,
      'go steps',
      SOUTH,
      'go steps',
      UP,
      NORTH,
      'go steps',
      UP,
      SOUTH,
      "go cottage|#{OUT}",
    ]
  end

  def location
    "alchemist|#{SOLHAVEN}"
  end

end
