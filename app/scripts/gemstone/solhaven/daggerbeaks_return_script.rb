load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/solhaven/daggerbeaks_script.rb", true

class DaggerbeaksReturnScript < DaggerbeaksScript
  include ReturnMovementScriptMixin
end
