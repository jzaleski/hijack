load "#{SCRIPTS_DIR}/dragonrealms/crossing/bank_script.rb", true

class TownHallScript < BankScript
  protected

  def directions
    [
      NORTHWEST,
      NORTH,
      EAST,
      "go town hall|#{OUT}",
    ]
  end

  def location
    "town_hall|#{CROSSING}"
  end
end
