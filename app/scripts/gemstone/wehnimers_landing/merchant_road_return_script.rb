load "#{APP_DIR}/scripts/gemstone/wehnimers_landing/merchant_road_script.rb", true

class MerchantRoadReturnScript < MerchantRoadScript
  protected

  def directions
    reverse_directions(super)
  end
end
