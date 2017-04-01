load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/slimy_little_grubs_script.rb", true

class SlimyLittleGrubsReturnScript < SlimyLittleGrubsScript
  include ReturnMovementScriptMixin
end
