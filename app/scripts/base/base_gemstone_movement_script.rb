load "#{MIXINS_DIR}/base/nexus_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/base/base_gemstone_script.rb", true

class BaseGemstoneMovementScript < BaseGemstoneScript
  include NexusMovementScriptMixin
end
