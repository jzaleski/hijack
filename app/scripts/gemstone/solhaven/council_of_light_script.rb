require 'scripts/base/base_gemstone_solhaven_movement_script'

class CouncilOfLightScript < BaseGemstoneSolhavenMovementScript

  protected

  def directions
    [
      SOUTHEAST,
      SOUTHEAST,
      SOUTH,
      SOUTH,
      SOUTH,
      SOUTH,
      SOUTH,
      SOUTH,
      'climb wall',
    ]
  end

  def location
    "council_of_light|#{SOLHAVEN}"
  end

end
