require_reload 'scripts/dragonrealms/crossing/armory_script'

class ArmoryReturnScript < ArmoryScript
  protected

  def directions
    reverse_directions(super)
  end
end
