load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/wayside_inn_script.rb", true

class WaysideInnReturnScript < WaysideInnScript
  include ReturnMovementScriptMixin
end
