load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/forest_trolls_script.rb", true

class ForestTrollsReturnScript < ForestTrollsScript
  include ReturnMovementScriptMixin
end
