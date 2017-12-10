load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/northern_caravansary/herbalists_tent_script.rb", true

class HerbalistsTentReturnScript < HerbalistsTentScript
  include ReturnMovementScriptMixin
end
