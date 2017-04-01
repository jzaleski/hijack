load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/abandoned_inn_script.rb", true

class AbandonedInnReturnScript < AbandonedInnScript
  include ReturnMovementScriptMixin
end
