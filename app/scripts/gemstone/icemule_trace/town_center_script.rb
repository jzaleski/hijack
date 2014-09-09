require 'scripts/base/base_gemstone_movement_script'

class TownCenterScript < BaseGemstoneMovementScript
  def location
    nexus_location
  end

  def nexus_location
    "town_center|#{ICEMULE_TRACE}"
  end
end
