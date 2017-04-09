load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/dragonrealms/crossing/armory_salesroom_script.rb", true

class ArmorySalesroomReturnScript < ArmorySalesroomScript
  include ReturnMovementScriptMixin
end
