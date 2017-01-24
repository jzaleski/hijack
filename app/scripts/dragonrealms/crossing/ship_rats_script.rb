require_reload 'scripts/dragonrealms/crossing/bank_script'

class ShipRatsScript < BankScript
  protected

  def directions
    [
      SOUTHWEST,
      'go bridge',
      SOUTHWEST,
      'go gate',
    ]
  end

  def location
    "ship_rats|#{CROSSING}"
  end
end
