load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/northern_caravansary/green_script.rb", true

class GreenReturnScript < GreenScript
  include ReturnMovementScriptMixin
end
