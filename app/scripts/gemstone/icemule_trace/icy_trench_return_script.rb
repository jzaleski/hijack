load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/icemule_trace/icy_trench_script.rb", true

class IcyTrenchReturnScript < IcyTrenchScript
  include ReturnMovementScriptMixin
end
