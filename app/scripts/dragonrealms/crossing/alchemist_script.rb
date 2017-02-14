load "#{SCRIPTS_DIR}/dragonrealms/crossing/bank_script.rb", true

class AlchemistScript < BankScript
  protected

  def directions
    [
      NORTHWEST,
      NORTH,
      NORTH,
      NORTH,
      NORTH,
      NORTH,
      NORTH,
      EAST,
      EAST,
      NORTH,
      WEST,
      NORTH,
      WEST,
      "go shop|#{OUT}",
    ]
  end

  def location
    "alchemist|#{CROSSING}"
  end
end
