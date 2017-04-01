load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/icemule_trace/snow_spectres_script.rb", true

class SnowSpectresReturnScript < SnowSpectresScript
  include ReturnMovementScriptMixin
end
