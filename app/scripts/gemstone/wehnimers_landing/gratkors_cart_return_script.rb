load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/gratkors_cart_script.rb", true

class GratkorsCartReturnScript < GratkorsCartScript
  include ReturnMovementScriptMixin
end
