load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/underground_ruin_stone_steps_script.rb", true

class UndergroundRuinStoneStepsReturnScript < UndergroundRuinStoneStepsScript
  include ReturnMovementScriptMixin
end
