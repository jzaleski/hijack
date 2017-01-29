load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/merchant_road_script.rb", true

class SeaNymphsScript < MerchantRoadScript
  protected

  def directions
    super + [
      WEST,
      WEST,
      NORTHWEST,
      WEST,
      WEST,
      WEST,
      NORTHWEST,
      NORTHWEST,
      WEST,
      WEST,
      SOUTHWEST,
    ]
  end

  def location
    "sea_nymphs|#{WEHNIMERS_LANDING}"
  end
end
