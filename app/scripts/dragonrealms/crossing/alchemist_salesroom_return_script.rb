load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/dragonrealms/crossing/alchemist_salesroom_script.rb", true

class AlchemistSalesroomReturnScript < AlchemistSalesroomScript
  include ReturnMovementScriptMixin
end
