load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/dyer_script.rb", true

class DyerReturnScript < DyerScript
  include ReturnMovementScriptMixin
end
