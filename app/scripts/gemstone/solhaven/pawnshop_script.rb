require 'scripts/base/base_gemstone_solhaven_movement_script'

class PawnshopScript < BaseGemstoneSolhavenMovementScript

  protected

  def directions
    [
      SOUTHWEST,
      SOUTH,
      "go shop|#{OUT}",
    ]
  end

  def location
    "pawnshop|#{SOLHAVEN}"
  end

end
