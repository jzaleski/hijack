load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/dragonrealms/crossing/wisdom_script.rb", true

class WisdomReturnScript < WisdomScript
  include ReturnMovementScriptMixin
end
