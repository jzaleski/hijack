load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/moot_hall_script.rb", true

class MootHallReturnScript < MootHallScript
  include ReturnMovementScriptMixin
end
