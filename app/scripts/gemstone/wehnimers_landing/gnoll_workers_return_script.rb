load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/gnoll_workers_script.rb", true

class GnollWorkersReturnScript < GnollWorkersScript
  include ReturnMovementScriptMixin
end
