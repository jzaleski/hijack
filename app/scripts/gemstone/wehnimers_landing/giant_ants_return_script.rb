load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/giant_ants_script.rb", true

class GiantAntsReturnScript < GiantAntsScript
  include ReturnMovementScriptMixin
end
