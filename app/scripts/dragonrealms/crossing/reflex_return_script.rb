load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/dragonrealms/crossing/reflex_script.rb", true

class ReflexReturnScript < ReflexScript
  include ReturnMovementScriptMixin
end
