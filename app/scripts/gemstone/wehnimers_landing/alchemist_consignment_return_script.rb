load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/alchemist_consignment_script.rb", true

class AlchemistConsignmentReturnScript < AlchemistConsignmentScript
  include ReturnMovementScriptMixin
end
