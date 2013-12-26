require 'scripts/base/base_gemstone_solhaven_movement_script'

class SolhavenInnScript < BaseGemstoneSolhavenMovementScript

  protected

  def directions
    [
      EAST,
      EAST,
      EAST,
      "go inn|#{OUT}",
    ]
  end

  def location
    "solhaven_inn|#{SOLHAVEN}"
  end

end
