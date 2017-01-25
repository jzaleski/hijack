require 'scripts/dragonrealms/crossing/ship_rats_script'

class ShipRatsReturnScript < ShipRatsScript
  protected

  def directions
    reverse_directions(super)
  end
end
