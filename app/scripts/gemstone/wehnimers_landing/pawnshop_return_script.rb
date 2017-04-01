load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/pawnshop_script.rb", true

class PawnshopReturnScript < PawnshopScript
  include ReturnMovementScriptMixin
end
