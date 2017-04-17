load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/dragonrealms/crossing/intelligence_script.rb", true

class IntelligenceReturnScript < IntelligenceScript
  include ReturnMovementScriptMixin
end
