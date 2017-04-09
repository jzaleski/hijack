load "#{SCRIPTS_DIR}/dragonrealms/crossing/outside_bank_script.rb", true

class OutsideShipRatsScript < OutsideBankScript
  protected

  def directions
    [
      SOUTHWEST,
      'go bridge',
      SOUTHWEST,
    ]
  end

  def location
    "outside_ship_rats|#{CROSSING}"
  end
end
