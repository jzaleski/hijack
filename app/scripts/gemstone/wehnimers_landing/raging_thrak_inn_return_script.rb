load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/raging_thrak_inn_script.rb", true

class RagingThrakInnReturnScript < RagingThrakInnScript
  include ReturnMovementScriptMixin
end
