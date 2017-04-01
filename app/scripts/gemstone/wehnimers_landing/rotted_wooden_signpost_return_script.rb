load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/rotted_wooden_signpost_script.rb", true

class RottedWoodenSignpostReturnScript < RottedWoodenSignpostScript
  include ReturnMovementScriptMixin
end
