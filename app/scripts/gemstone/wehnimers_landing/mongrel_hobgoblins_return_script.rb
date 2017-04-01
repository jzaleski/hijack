load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/mongrel_hobgoblins_script.rb", true

class MongrelHobgoblinsReturnScript < MongrelHobgoblinsScript
  include ReturnMovementScriptMixin
end
