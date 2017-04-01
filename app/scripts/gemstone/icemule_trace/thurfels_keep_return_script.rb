load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/icemule_trace/thurfels_keep_script.rb", true

class ThurfelsKeepReturnScript < ThurfelsKeepScript
  include ReturnMovementScriptMixin
end
