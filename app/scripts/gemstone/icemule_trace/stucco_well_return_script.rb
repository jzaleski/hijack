load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/icemule_trace/stucco_well_script.rb", true

class StuccoWellReturnScript < StuccoWellScript
  include ReturnMovementScriptMixin
end
