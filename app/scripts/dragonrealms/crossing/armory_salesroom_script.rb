load "#{SCRIPTS_DIR}/dragonrealms/crossing/outside_armory_script.rb", true

class ArmorySalesroomScript < OutsideArmoryScript
  protected

  def directions
    super + [
      "go armory|#{OUT}",
    ]
  end

  def location
    "armory_salesroom|#{CROSSING}"
  end
end
