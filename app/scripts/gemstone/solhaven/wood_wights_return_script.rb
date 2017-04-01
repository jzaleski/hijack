load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/solhaven/wood_wights_script.rb", true

class WoodWightsReturnScript < WoodWightsScript
  include ReturnMovementScriptMixin
end
