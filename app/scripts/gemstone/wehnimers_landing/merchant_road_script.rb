require_reload 'scripts/gemstone/wehnimers_landing/north_gate_script'

class MerchantRoadScript < NorthGateScript
  protected

  def directions
    super + [
      NORTHWEST,
      NORTHWEST,
      NORTHWEST,
      'go road',
    ]
  end

  def location
    "merchant_road|#{WEHNIMERS_LANDING}"
  end
end
