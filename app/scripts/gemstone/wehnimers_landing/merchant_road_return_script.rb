require_reload 'scripts/gemstone/wehnimers_landing/merchant_road_script'

class MerchantRoadReturnScript < MerchantRoadScript
  protected

  def directions
    reverse_directions(super)
  end
end
