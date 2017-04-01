load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/dragonrealms/crossing/ship_rats_script.rb", true

class ShipRatsReturnScript < ShipRatsScript
  include ReturnMovementScriptMixin
end
