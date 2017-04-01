load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/icemule_trace/house_of_paupers_script.rb", true

class HouseOfPaupersReturnScript < HouseOfPaupersScript
  include ReturnMovementScriptMixin
end
