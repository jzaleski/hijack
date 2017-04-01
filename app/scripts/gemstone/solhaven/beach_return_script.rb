load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/solhaven/beach_script.rb", true

class BeachReturnScript < BeachScript
  include ReturnMovementScriptMixin
end
