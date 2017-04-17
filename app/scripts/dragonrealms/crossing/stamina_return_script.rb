load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/dragonrealms/crossing/stamina_script.rb", true

class StaminaReturnScript < StaminaScript
  include ReturnMovementScriptMixin
end
