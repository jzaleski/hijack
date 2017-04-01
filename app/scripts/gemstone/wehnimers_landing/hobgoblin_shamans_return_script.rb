load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/hobgoblin_shamans_script.rb", true

class HobgoblinShamansReturnScript < HobgoblinShamansScript
  include ReturnMovementScriptMixin
end
