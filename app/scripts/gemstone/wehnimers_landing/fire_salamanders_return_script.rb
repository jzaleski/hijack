load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/fire_salamanders_script.rb", true

class FireSalamandersReturnScript < FireSalamandersScript
  include ReturnMovementScriptMixin
end
