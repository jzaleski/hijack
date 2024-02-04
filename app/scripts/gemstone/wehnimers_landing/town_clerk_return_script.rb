load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/town_clerk_script.rb", true

class TownClerkReturnScript < TownClerkScript
  include ReturnMovementScriptMixin
end
