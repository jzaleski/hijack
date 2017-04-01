load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/merchant_road_script.rb", true

class MerchantRoadReturnScript < MerchantRoadScript
  include ReturnMovementScriptMixin
end
