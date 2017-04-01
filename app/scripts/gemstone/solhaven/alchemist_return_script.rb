load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/solhaven/alchemist_script.rb", true

class AlchemistReturnScript < AlchemistScript
  include ReturnMovementScriptMixin
end
