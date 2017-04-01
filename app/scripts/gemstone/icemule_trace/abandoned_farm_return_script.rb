load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/icemule_trace/abandoned_farm_script.rb", true

class AbandonedFarmReturnScript < AbandonedFarmScript
  include ReturnMovementScriptMixin
end
