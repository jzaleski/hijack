load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/dragonrealms/crossing/discipline_script.rb", true

class DisciplineReturnScript < DisciplineScript
  include ReturnMovementScriptMixin
end
