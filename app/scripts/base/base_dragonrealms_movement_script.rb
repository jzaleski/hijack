load "#{MIXINS_DIR}/base/nexus_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/base/base_dragonrealms_script.rb", true

class BaseDragonrealmsMovementScript < BaseDragonrealmsScript
  include NexusMovementScriptMixin
end
