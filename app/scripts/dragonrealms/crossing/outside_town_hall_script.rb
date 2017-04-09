load "#{SCRIPTS_DIR}/dragonrealms/crossing/outside_bank_script.rb", true

class OutsideTownHallScript < OutsideBankScript
  protected

  def directions
    [
      NORTHWEST,
      NORTH,
      EAST,
    ]
  end

  def location
    "outside_town_hall|#{CROSSING}"
  end
end
