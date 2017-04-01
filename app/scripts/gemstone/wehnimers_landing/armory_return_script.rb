load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/armory_script.rb", true

class ArmoryReturnScript < ArmoryScript
  include ReturnMovementScriptMixin
end
