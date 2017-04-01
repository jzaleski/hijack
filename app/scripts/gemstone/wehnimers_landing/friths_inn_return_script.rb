load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/friths_inn_script.rb", true

class FrithsInnReturnScript < FrithsInnScript
  include ReturnMovementScriptMixin
end
