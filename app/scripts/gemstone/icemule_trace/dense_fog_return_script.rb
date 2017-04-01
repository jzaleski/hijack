load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/icemule_trace/dense_fog_script.rb", true

class DenseFogReturnScript < DenseFogScript
  include ReturnMovementScriptMixin
end
