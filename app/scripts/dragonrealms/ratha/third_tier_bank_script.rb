require 'scripts/base/base_dragonrealms_ratha_movement_script'

class ThirdTierBankScript < BaseDragonrealmsRathaMovementScript

  protected

  def directions
    super + [
      SOUTH,
      WEST,
      WEST,
      SOUTH,
      SOUTHWEST,
      SOUTH,
      WEST,
      'go gate',
      NORTH,
      NORTH,
      'climb stair',
      'go door',
      EAST,
      EAST,
    ]
  end

  def location
    "third_tier_bank|#{RATHA}"
  end

end
