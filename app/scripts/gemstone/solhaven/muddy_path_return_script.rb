load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/solhaven/muddy_path_script.rb", true

class MuddyPathReturnScript < MuddyPathScript
  include ReturnMovementScriptMixin
end
