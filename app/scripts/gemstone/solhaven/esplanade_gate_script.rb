require 'scripts/base/base_gemstone_solhaven_movement_script'

class EsplanadeGateScript < BaseGemstoneSolhavenMovementScript

  protected

  def directions
    [
      SOUTHEAST,
      SOUTHEAST,
      SOUTH,
      EAST,
      EAST,
      EAST,
      EAST,
    ]
  end

  def location
    "esplanade_gate|#{SOLHAVEN}"
  end

end
