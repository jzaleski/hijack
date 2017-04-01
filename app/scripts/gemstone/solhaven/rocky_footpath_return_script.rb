load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/solhaven/rocky_footpath_script.rb", true

class RockyFootpathReturnScript < RockyFootpathScript
  include ReturnMovementScriptMixin
end
