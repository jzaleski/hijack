load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/glatoph_script.rb", true

class GlatophReturnScript < GlatophScript
  include ReturnMovementScriptMixin
end
