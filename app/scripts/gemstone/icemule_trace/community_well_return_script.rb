load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/icemule_trace/community_well_script.rb", true

class CommunityWellReturnScript < CommunityWellScript
  include ReturnMovementScriptMixin
end
