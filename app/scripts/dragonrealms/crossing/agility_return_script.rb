load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/dragonrealms/crossing/agility_script.rb", true

class AgilityReturnScript < AgilityScript
  include ReturnMovementScriptMixin
end
