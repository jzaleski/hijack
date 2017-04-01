load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/troglodytes_script.rb", true

class TroglodytesReturnScript < TroglodytesScript
  include ReturnMovementScriptMixin
end
