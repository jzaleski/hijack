load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/firephantoms_script.rb", true

class FirephantomsReturnScript < FirephantomsScript
  include ReturnMovementScriptMixin
end
