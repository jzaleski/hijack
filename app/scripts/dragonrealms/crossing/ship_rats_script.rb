load "#{SCRIPTS_DIR}/dragonrealms/crossing/bank_script.rb", true

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
