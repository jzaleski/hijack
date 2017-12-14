load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/northern_caravansary/gnoll_rangers_script.rb", true

class GnollRangersReturnScript < GnollRangersScript
  include ReturnMovementScriptMixin
end
