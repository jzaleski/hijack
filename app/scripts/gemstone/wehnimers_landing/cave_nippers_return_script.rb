load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/cave_nippers_script.rb", true

class CaveNippersReturnScript < CaveNippersScript
  include ReturnMovementScriptMixin
end
