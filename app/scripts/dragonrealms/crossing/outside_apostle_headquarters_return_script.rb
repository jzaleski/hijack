load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/dragonrealms/crossing/outside_apostle_headquarters_script.rb", true

class OutsideApostleHeadquartersReturnScript < OutsideApostleHeadquartersScript
  include ReturnMovementScriptMixin
end
