load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/darkstone_pool_script.rb", true

class DarkstonePoolReturnScript < DarkstonePoolScript
  include ReturnMovementScriptMixin
end
