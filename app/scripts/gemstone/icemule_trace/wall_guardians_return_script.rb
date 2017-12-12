load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/icemule_trace/wall_guardians_script.rb", true

class WallGuardiansReturnScript < WallGuardiansScript
  include ReturnMovementScriptMixin
end
