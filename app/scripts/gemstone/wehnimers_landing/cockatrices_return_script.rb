load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/cockatrices_script.rb", true

class CockatricesReturnScript < CockatricesScript
  include ReturnMovementScriptMixin
end
