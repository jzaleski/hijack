require 'scripts/base/base_dragonrealms_ratha_movement_script'

class ThirdTierGratingScript < BaseDragonrealmsRathaMovementScript

  protected

  def directions
    super + [
      SOUTH,
      WEST,
      WEST,
      NORTHWEST,
      NORTHEAST,
    ]
  end

  def location
    "third_tier_grating_script|#{RATHA}"
  end

end
