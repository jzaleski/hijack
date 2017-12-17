load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/clerics_shop_script.rb", true

class ClericsShopReturnScript < ClericsShopScript
  include ReturnMovementScriptMixin
end
