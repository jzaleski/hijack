load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/helgas_tavern_script.rb", true

class HelgasTavernReturnScript < HelgasTavernScript
  include ReturnMovementScriptMixin
end
