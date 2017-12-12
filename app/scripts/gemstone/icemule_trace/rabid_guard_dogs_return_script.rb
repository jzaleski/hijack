load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/icemule_trace/rabid_guard_dogs_script.rb", true

class RabidGuardDogsReturnScript < RabidGuardDogsScript
  include ReturnMovementScriptMixin
end
