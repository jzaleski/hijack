load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/giant_marmots_script.rb", true

class GiantMarmotsReturnScript < GiantMarmotsScript
  include ReturnMovementScriptMixin
end
