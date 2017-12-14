load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/northern_caravansary/gnoll_thieves_script.rb", true

class GnollThievesReturnScript < GnollThievesScript
  include ReturnMovementScriptMixin
end
