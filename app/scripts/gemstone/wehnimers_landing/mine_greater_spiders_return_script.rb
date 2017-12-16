load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/mine_greater_spiders_script.rb", true

class MineGreaterSpidersReturnScript < MineGreaterSpidersScript
  include ReturnMovementScriptMixin
end
