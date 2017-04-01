load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/solhaven/muddy_trail_script.rb", true

class MuddyTrailReturnScript < MuddyTrailScript
  include ReturnMovementScriptMixin
end
