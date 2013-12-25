require 'scripts/base/base_gemstone_wehnimers_landing_movement_script'

class RagingThrakInnScript < BaseGemstoneWehnimersLandingMovementScript

  protected

  def directions
    [
      NORTHWEST,
      "go inn|#{OUT}",
    ]
  end

  def location
    "raging_thrak_inn|#{WEHNIMERS_LANDING}"
  end

end
