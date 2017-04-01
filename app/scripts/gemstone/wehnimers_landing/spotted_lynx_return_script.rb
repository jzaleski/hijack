load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/spotted_lynx_script.rb", true

class SpottedLynxReturnScript < SpottedLynxScript
  include ReturnMovementScriptMixin
end
