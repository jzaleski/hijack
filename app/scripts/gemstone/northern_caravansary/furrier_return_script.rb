load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/northern_caravansary/furrier_script.rb", true

class FurrierReturnScript < FurrierScript
  include ReturnMovementScriptMixin
end
