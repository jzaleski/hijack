load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/general_store_script.rb", true

class GeneralStoreReturnScript < GeneralStoreScript
  include ReturnMovementScriptMixin
end
