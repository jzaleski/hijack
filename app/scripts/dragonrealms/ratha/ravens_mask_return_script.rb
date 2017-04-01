load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/dragonrealms/ratha/ravens_mask_script.rb", true

class RavensMaskReturnScript < RavensMaskScript
  include ReturnMovementScriptMixin
end
