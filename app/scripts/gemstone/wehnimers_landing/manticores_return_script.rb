load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/manticores_script.rb", true

class ManticoresReturnScript < ManticoresScript
  include ReturnMovementScriptMixin
end
