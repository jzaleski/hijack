load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/greater_spiders_script.rb", true

class GreaterSpidersReturnScript < GreaterSpidersScript
  include ReturnMovementScriptMixin
end
