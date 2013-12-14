require 'scripts/base/base_gemstone_solhaven_movement_script'

class BankScript < BaseGemstoneSolhavenMovementScript

  protected

  def directions
    [
      SOUTHEAST,
      EAST,
      "go bank|#{OUT}",
    ]
  end

  def location
    "bank|#{SOLHAVEN}"
  end

end
