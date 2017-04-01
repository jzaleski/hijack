load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/dragonrealms/ratha/krriktks_forge_script.rb", true

class KrriktksForgeReturnScript < KrriktksForgeScript
  include ReturnMovementScriptMixin
end
