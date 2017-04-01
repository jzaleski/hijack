load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/rotting_corpses_script.rb", true

class RottingCorpsesReturnScript < RottingCorpsesScript
  include ReturnMovementScriptMixin
end
