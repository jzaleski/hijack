require 'scripts/base/base_gemstone_wehnimers_landing_movement_script'

class BankScript < BaseGemstoneWehnimersLandingMovementScript

  protected

  def directions
    [
      WEST,
      "go bank|#{OUT}",
      'go arch',
    ]
  end

  def location
    "bank|#{WEHNIMERS_LANDING}"
  end

end
