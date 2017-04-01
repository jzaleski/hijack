load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/solhaven/cavern_script.rb", true

class CavernReturnScript < CavernScript
  include ReturnMovementScriptMixin
end
