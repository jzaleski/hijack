load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/northern_caravansary/tavern_script.rb", true

class TavernReturnScript < TavernScript
  include ReturnMovementScriptMixin
end
