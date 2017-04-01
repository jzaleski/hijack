load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/solhaven/gemshop_script.rb", true

class GemshopReturnScript < GemshopScript
  include ReturnMovementScriptMixin
end
