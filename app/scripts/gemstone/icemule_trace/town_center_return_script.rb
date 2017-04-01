load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/icemule_trace/town_center_script.rb", true

class TownCenterReturnScript < TownCenterScript
  include ReturnMovementScriptMixin
end
