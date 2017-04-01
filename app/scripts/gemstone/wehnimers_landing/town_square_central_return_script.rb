load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/town_square_central_script.rb", true

class TownSquareCentralReturnScript < TownSquareCentralScript
  include ReturnMovementScriptMixin
end
