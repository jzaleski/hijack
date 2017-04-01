load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/solhaven/shelfae_soldiers_script.rb", true

class ShelfaeSoldiersReturnScript < ShelfaeSoldiersScript
  include ReturnMovementScriptMixin
end
