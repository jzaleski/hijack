load "#{APP_DIR}/scripts/dragonrealms/crossing/bank_script.rb", true

class ArmoryScript < BankScript
  protected

  def directions
    [
      NORTHWEST,
      NORTH,
      NORTH,
      NORTHWEST,
      "go armory|#{OUT}",
    ]
  end

  def location
    "armory|#{CROSSING}"
  end
end
