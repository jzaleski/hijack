load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/dragonrealms/crossing/charisma_script.rb", true

class CharismaReturnScript < CharismaScript
  include ReturnMovementScriptMixin
end
