load "#{APP_DIR}/scripts/base/base_gemstone_movement_script.rb", true

class NorthMarketScript < BaseGemstoneMovementScript
  def location
    nexus_location
  end

  def nexus_location
    "north_market|#{SOLHAVEN}"
  end
end
