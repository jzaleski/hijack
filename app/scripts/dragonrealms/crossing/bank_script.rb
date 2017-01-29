load "#{SCRIPTS_DIR}/base/base_dragonrealms_movement_script.rb", true

class BankScript < BaseDragonrealmsMovementScript
  def location
    nexus_location
  end

  def nexus_location
    "bank|#{CROSSING}"
  end
end
