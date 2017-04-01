load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/mammoth_rockslide_script.rb", true

class MammothRockslideReturnScript < MammothRockslideScript
  include ReturnMovementScriptMixin
end
