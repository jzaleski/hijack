load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/icemule_trace/thirsty_penguin_front_desk_script.rb", true

class ThirstyPenguinFrontDeskReturnScript < ThirstyPenguinFrontDeskScript
  include ReturnMovementScriptMixin
end
