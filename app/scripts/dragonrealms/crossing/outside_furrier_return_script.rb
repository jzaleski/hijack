load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/dragonrealms/crossing/outside_furrier_script.rb", true

class OutsideFurrierReturnScript < OutsideFurrierScript
  include ReturnMovementScriptMixin
end
