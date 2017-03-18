load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/merchant_road_script.rb", true

class LeapersScript < MerchantRoadScript
  protected

  def directions
    super + [
      WEST,
      WEST,
      NORTHWEST,
      SOUTHWEST,
      SOUTH,
      "#{SOUTHWEST}|go gap",
    ]
  end

  def location
    "leapers|#{WEHNIMERS_LANDING}"
  end
end
