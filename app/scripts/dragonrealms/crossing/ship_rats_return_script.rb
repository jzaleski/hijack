load "#{APP_DIR}/scripts/dragonrealms/crossing/ship_rats_script.rb", true

class ShipRatsReturnScript < ShipRatsScript
  protected

  def directions
    reverse_directions(super)
  end
end
