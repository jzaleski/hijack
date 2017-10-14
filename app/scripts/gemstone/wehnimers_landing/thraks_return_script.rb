load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/thraks_script.rb", true

class ThraksReturnScript < ThraksScript
  include ReturnMovementScriptMixin
end
