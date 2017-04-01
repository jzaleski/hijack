load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/rocky_stream_script.rb", true

class RockyStreamReturnScript < RockyStreamScript
  include ReturnMovementScriptMixin
end
