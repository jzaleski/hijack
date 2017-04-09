load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/dragonrealms/crossing/town_hall_debtors_office_script.rb", true

class TownHallDebtorsOfficeReturnScript < TownHallDebtorsOfficeScript
  include ReturnMovementScriptMixin
end
