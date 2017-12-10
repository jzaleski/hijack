load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/northern_caravansary/gnoll_workers_script.rb", true

class GnollWorkersReturnScript < GnollWorkersScript
  include ReturnMovementScriptMixin
end
