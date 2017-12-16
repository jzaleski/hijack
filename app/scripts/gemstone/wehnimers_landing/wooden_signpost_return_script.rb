load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/wooden_signpost_script.rb", true

class WoodenSignpostReturnScript < WoodenSignpostScript
  include ReturnMovementScriptMixin
end
