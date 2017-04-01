load "#{MIXINS_DIR}/base/return_movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/gemstone/solhaven/council_of_light_nexus_script.rb", true

class CouncilOfLightNexusReturnScript < CouncilOfLightNexusScript
  include ReturnMovementScriptMixin
end
