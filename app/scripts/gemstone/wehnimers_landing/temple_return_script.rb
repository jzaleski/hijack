load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/temple_script.rb", true

class TempleReturnScript < TempleScript
  include ReturnMovementScriptMixin
end
