load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/treehouse_script.rb", true

class TreehouseReturnScript < TreehouseScript
  include ReturnMovementScriptMixin
end
