load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/small_park_script.rb", true

class SmallParkReturnScript < SmallParkScript
  include ReturnMovementScriptMixin
end
