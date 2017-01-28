load "#{APP_DIR}/scripts/base/base_gemstone_movement_script.rb", true

class TownSquareCentralScript < BaseGemstoneMovementScript
  def location
    nexus_location
  end

  def nexus_location
    "town_square_central|#{WEHNIMERS_LANDING}"
  end
end
