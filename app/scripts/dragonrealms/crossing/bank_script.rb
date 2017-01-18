require 'scripts/base/base_dragonrealms_movement_script'

class BankScript < BaseDragonrealmsMovementScript
  def location
    nexus_location
  end

  def nexus_location
    "bank|#{CROSSING}"
  end
end
