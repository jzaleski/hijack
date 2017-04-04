load "#{MIXINS_DIR}/base/movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/base/base_dragonrealms_script.rb", true

class TownGreenScript < BaseDragonrealmsScript
  include MovementScriptMixin

  protected

  def directions
    []
  end

  def location
    nexus_location
  end

  def nexus_location
    "town_green|#{RATHA}"
  end
end
