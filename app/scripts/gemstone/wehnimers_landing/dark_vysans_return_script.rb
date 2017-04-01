load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/dark_vysans_script.rb", true

class DarkVysansReturnScript < DarkVysansScript
  include ReturnMovementScriptMixin
end
