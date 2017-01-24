require_reload 'scripts/gemstone/wehnimers_landing/merchant_road_script'

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
