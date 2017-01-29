load "#{SCRIPTS_DIR}/base/base_dragonrealms_movement_script.rb", true

class TownGreenScript < BaseDragonrealmsMovementScript
  def location
    nexus_location
  end

  def nexus_location
    "town_green|#{RATHA}"
  end
end
