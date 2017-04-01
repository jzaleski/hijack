load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/icemule_trace/silverback_orcs_script.rb", true

class SilverbackOrcsReturnScript < SilverbackOrcsScript
  include ReturnMovementScriptMixin
end
