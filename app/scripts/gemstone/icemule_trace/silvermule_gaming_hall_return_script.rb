load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/icemule_trace/silvermule_gaming_hall_script.rb", true

class SilvermuleGamingHallReturnScript < SilvermuleGamingHallScript
  include ReturnMovementScriptMixin
end
