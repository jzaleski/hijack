load "#{MIXINS_DIR}/base/movement_script_mixin.rb", true
load "#{SCRIPTS_DIR}/base/base_dragonrealms_script.rb", true

class OutsideBankScript < BaseDragonrealmsScript
  include MovementScriptMixin

  protected

  def directions
    []
  end

  def location
    nexus_location
  end

  def nexus_location
    "outside_bank|#{CROSSING}"
  end
end
