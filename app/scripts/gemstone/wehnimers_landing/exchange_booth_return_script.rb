load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/exchange_booth_script.rb", true

class ExchangeBoothReturnScript < ExchangeBoothScript
  include ReturnMovementScriptMixin
end
