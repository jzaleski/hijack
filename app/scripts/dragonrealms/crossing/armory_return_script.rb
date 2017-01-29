load "#{SCRIPTS_DIR}/dragonrealms/crossing/armory_script.rb", true

class ArmoryReturnScript < ArmoryScript
  protected

  def directions
    reverse_directions(super)
  end
end
