require 'scripts/base/base_gemstone_solhaven_movement_script'

class FurrierScript < BaseGemstoneSolhavenMovementScript

  protected

  def directions
    [
      SOUTHWEST,
      "go shop|#{OUT}",
    ]
  end

  def location
    "furrier|#{SOLHAVEN}"
  end

end
