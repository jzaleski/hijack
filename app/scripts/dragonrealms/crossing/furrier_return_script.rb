load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/dragonrealms/crossing/furrier_script.rb", true

class FurrierReturnScript < FurrierScript
  include ReturnMovementScriptMixin
end
