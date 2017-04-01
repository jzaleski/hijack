load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/east_tower_script.rb", true

class EastTowerReturnScript < EastTowerScript
  include ReturnMovementScriptMixin
end
