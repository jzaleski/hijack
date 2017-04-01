load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/icemule_trace/clovertooth_hall_script.rb", true

class ClovertoothHallReturnScript < ClovertoothHallScript
  include ReturnMovementScriptMixin
end
