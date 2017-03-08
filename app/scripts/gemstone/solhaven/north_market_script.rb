load "#{SCRIPTS_DIR}/base/base_gemstone_movement_script.rb", true

class NorthMarketScript < BaseGemstoneMovementScript
  protected

  def location
    nexus_location
  end

  def nexus_location
    "north_market|#{SOLHAVEN}"
  end
end
