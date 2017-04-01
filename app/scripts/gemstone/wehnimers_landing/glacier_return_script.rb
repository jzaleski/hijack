load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/glacier_script.rb", true

class GlacierReturnScript < GlacierScript
  include ReturnMovementScriptMixin
end
