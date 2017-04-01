load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/leapers_script.rb", true

class LeapersReturnScript < LeapersScript
  include ReturnMovementScriptMixin
end
