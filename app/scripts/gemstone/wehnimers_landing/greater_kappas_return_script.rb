load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/greater_kappas_script.rb", true

class GreaterKappasReturnScript < GreaterKappasScript
  include ReturnMovementScriptMixin
end
