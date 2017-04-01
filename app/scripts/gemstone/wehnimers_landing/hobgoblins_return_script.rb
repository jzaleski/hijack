load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/hobgoblins_script.rb", true

class HobgoblinsReturnScript < HobgoblinsScript
  include ReturnMovementScriptMixin
end
