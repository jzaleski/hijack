load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/sea_nymphs_script.rb", true

class SeaNymphsReturnScript < SeaNymphsScript
  include ReturnMovementScriptMixin
end
