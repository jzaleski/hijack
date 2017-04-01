load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/solhaven/north_market_script.rb", true

class NorthMarketReturnScript < NorthMarketScript
  include ReturnMovementScriptMixin
end
