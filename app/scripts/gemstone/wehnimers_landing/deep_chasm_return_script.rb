load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/deep_chasm_script.rb", true

class DeepChasmReturnScript < DeepChasmScript
  include ReturnMovementScriptMixin
end
