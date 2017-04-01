load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/gremlins_script.rb", true

class GremlinsReturnScript < GremlinsScript
  include ReturnMovementScriptMixin
end
