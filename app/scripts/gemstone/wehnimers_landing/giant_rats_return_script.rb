load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/giant_rats_script.rb", true

class GiantRatsReturnScript < GiantRatsScript
  include ReturnMovementScriptMixin
end
