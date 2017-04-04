load "#{MIXINS_DIR}/base/movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/base/base_gemstone_script.rb", true

class TownSquareCentralScript < BaseGemstoneScript
  include MovementScriptMixin

  protected

  def directions
    []
  end

  def location
    nexus_location
  end

  def nexus_location
    "town_square_central|#{WEHNIMERS_LANDING}"
  end
end
