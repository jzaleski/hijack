load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/solhaven/solhaven_inn_script.rb", true

class SolhavenInnReturnScript < SolhavenInnScript
  include ReturnMovementScriptMixin
end
