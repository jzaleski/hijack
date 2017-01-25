require 'scripts/gemstone/wehnimers_landing/east_tower_script'

class EastTowerReturnScript < EastTowerScript
  protected

  def directions
    reverse_directions(super)
  end
end
