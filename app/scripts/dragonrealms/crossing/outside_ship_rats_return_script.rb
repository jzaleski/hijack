load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/dragonrealms/crossing/outside_ship_rats_script.rb", true

class OutsideShipRatsReturnScript < OutsideShipRatsScript
  include ReturnMovementScriptMixin
end
