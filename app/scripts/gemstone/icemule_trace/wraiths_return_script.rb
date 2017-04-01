load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/icemule_trace/wraiths_script.rb", true

class WraithsReturnScript < WraithsScript
  include ReturnMovementScriptMixin
end
