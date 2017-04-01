load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/icemule_trace/thirsty_penguin_script.rb", true

class ThirstyPenguinReturnScript < ThirstyPenguinScript
  include ReturnMovementScriptMixin
end
