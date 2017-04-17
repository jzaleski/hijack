load "#{SCRIPTS_DIR}/dragonrealms/crossing/armory_salesroom_script.rb", true

class StrengthScript < ArmorySalesroomScript
  protected

  def directions
    super + [
      "go doorway|#{OUT}",
      "go bellows room|#{OUT}",
    ]
  end

  def location
    "strength|#{CROSSING}"
  end
end
