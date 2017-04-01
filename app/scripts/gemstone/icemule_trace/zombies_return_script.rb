load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/icemule_trace/zombies_script.rb", true

class ZombiesReturnScript < ZombiesScript
  include ReturnMovementScriptMixin
end
