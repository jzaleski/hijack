load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/gnoll_thieves_script.rb", true

class GnollThievesReturnScript < GnollThievesScript
  include ReturnMovementScriptMixin
end
