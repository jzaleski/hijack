load "#{SCRIPTS_DIR}/dragonrealms/crossing/outside_ship_rats_script.rb", true

class ShipRatsScript < OutsideShipRatsScript
  protected

  def directions
    super + [
      'go gate',
    ]
  end

  def location
    "ship_rats|#{CROSSING}"
  end
end
