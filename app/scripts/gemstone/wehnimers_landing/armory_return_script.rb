require_reload 'scripts/gemstone/wehnimers_landing/armory_script'

class ArmoryReturnScript < ArmoryScript
  protected

  def directions
    reverse_directions(super)
  end
end
