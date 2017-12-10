load "#{MIXINS_DIR}/base/movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/base/base_gemstone_script.rb", true

class GreenScript < BaseGemstoneScript
  include MovementScriptMixin

  protected

  def directions
    []
  end

  def location
    nexus_location
  end

  def nexus_location
    "green|#{NORTHERN_CARAVANSARY}"
  end
end
