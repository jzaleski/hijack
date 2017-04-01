load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/cave_gnolls_script.rb", true

class CaveGnollsReturnScript < CaveGnollsScript
  include ReturnMovementScriptMixin
end
