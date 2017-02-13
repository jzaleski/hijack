load "#{SCRIPTS_DIR}/dragonrealms/crossing/bank_script.rb", true

class EmpathsGuildScript < BankScript
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
      "go door|#{OUT}",
    ]
  end

  def location
    "empaths_guild|#{CROSSING}"
  end
end
