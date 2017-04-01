load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/skeletal_lords_script.rb", true

class SkeletalLordsReturnScript < SkeletalLordsScript
  include ReturnMovementScriptMixin
end
