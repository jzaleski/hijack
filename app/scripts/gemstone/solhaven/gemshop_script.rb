require 'scripts/base/base_gemstone_solhaven_movement_script'

class GemshopScript < BaseGemstoneSolhavenMovementScript

  protected

  def directions
    [
      NORTHEAST,
      "go door|#{OUT}",
    ]
  end

  def location
    "gemshop|#{SOLHAVEN}"
  end

end
